# Docker Setup Guide for Vnmonitoring

## 📋 Tổng Quan
Hướng dẫn chạy ứng dụng Vnmonitoring bằng Docker với múi giờ Việt Nam (UTC+7).

## ✅ Các Thay Đổi Đã Thực Hiện

### 1. **TimeZone Helper (Vnmonitoring.Server/Utilities/TimeZoneHelper.cs)**
   - Tạo lớp helper để xử lý múi giờ Việt Nam (UTC+7)
   - Các phương thức:
     - `GetVietnamNow()` - Lấy thời gian hiện tại theo giờ Việt Nam
     - `GetVietnamToday()` - Lấy ngày hôm nay theo giờ Việt Nam
     - `ConvertToVietnamTime()` - Chuyển đổi UTC sang giờ Việt Nam
     - `ConvertToUtc()` - Chuyển đổi giờ Việt Nam sang UTC

### 2. **Cập Nhật Services**
   
   **RainDataService.cs**
   - Thay `DateTime.Now` → `TimeZoneHelper.GetVietnamNow()`
   - Đảm bảo dữ liệu mưa được lấy theo giờ Việt Nam

   **RainDataHostedService.cs**
   - Thay `DateTime.Now` → `TimeZoneHelper.GetVietnamNow()`
   - Đảm bảo lịch chạy được lên lịch theo giờ Việt Nam

   **JwtService.cs**
   - Thay `DateTime.UtcNow` → `TimeZoneHelper.GetVietnamNow()`
   - Đảm bảo token JWT hết hạn theo giờ Việt Nam

### 3. **Docker Configuration**

   **Dockerfile**
   - Thêm timezone setup cho container:
     ```dockerfile
     RUN apt-get update && apt-get install -y tzdata && \
         ln -sf /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime && \
         echo "Asia/Ho_Chi_Minh" > /etc/timezone
     ```

   **docker-compose.yml**
   - Thêm `TZ=Asia/Ho_Chi_Minh` environment variable cho tất cả services
   - Thêm `depends_on: db` cho service `api` để đảm bảo database sẵn sàng

## 🚀 Cách Chạy Với Docker

### Prerequisites
- Docker Desktop (hoặc Docker + Docker Compose)
- Git

### Bước 1: Clone Repository
```bash
git clone https://github.com/minhtri567/Vnmonitoring.git
cd Vnmonitoring
```

### Bước 2: Cập Nhật Cấu Hình
Sửa file `docker-compose.yml` nếu cần (tuỳ chỉnh port, password, etc.):

```yaml
- Jwt__Key=your_super_secret_key_123456789_minimum_32_characters
- ConnectionStrings__DefaultConnection=Host=db;Port=5432;Database=data_monitoring;Username=postgres;Password=your_password
```

### Bước 3: Build và Chạy
```bash
# Build images và khởi động tất cả services
docker-compose up -d

# Xem logs
docker-compose logs -f api

# Kiểm tra status
docker-compose ps
```

### Bước 4: Kiểm Tra Ứng Dụng
- **API**: http://localhost:7101
- **Swagger UI**: http://localhost:7101/swagger
- **Client**: http://localhost:3000 (nếu có frontend)
- **PostgreSQL**: localhost:5432

## 🔧 Các Lệnh Hữu Ích

```bash
# Dừng tất cả services
docker-compose down

# Dừng và xoá volumes (database)
docker-compose down -v

# Rebuild images
docker-compose build

# Chạy lại services
docker-compose up -d

# Xem logs của service cụ thể
docker-compose logs -f api      # API logs
docker-compose logs -f db       # Database logs
docker-compose logs -f client   # Client logs

# Truy cập container
docker-compose exec api bash
docker-compose exec db psql -U postgres -d data_monitoring

# Cập nhật code mà không rebuild
docker-compose up -d --no-build
```

## 📊 Xác Minh Múi Giờ

### Kiểm tra trong container:
```bash
docker-compose exec api date
# Output sẽ hiển thị giờ Việt Nam (UTC+7)

docker-compose exec db date
# Output sẽ hiển thị giờ Việt Nam (UTC+7)
```

### Kiểm tra trong logs:
```bash
docker-compose logs api | grep "Đợi đến giờ tiếp theo"
# Thời gian sẽ theo giờ Việt Nam
```

## 🐛 Troubleshooting

### 1. Database không kết nối
```bash
# Kiểm tra status database
docker-compose ps db

# Xem logs database
docker-compose logs db

# Kiểm tra connection string trong docker-compose.yml
```

### 2. Port đã được sử dụng
```bash
# Thay đổi port trong docker-compose.yml
# ports:
#   - "7101:8080"  # Thay 7101 bằng port khác nếu cần
```

### 3. Timezone vẫn sai
```bash
# Kiểm tra timezone trong container
docker-compose exec api bash -c "echo \$TZ"
docker-compose exec api date

# Nếu vẫn sai, xoá container và rebuild
docker-compose down
docker-compose build --no-cache
docker-compose up -d
```

## 📝 Biến Môi Trường

| Biến | Giá Trị Mặc Định | Mô Tả |
|------|-----------------|-------|
| `ASPNETCORE_ENVIRONMENT` | Development | Môi trường (.NET) |
| `ASPNETCORE_URLS` | http://+:8080 | URL binding |
| `Jwt__Key` | super_secret_key... | JWT secret key |
| `ConnectionStrings__DefaultConnection` | Host=db;... | PostgreSQL connection |
| `TZ` | Asia/Ho_Chi_Minh | Múi giờ Việt Nam |

## 🔐 Bảo Mật

⚠️ **Lưu ý**: Không commit credentials vào repository!

1. Tạo file `.env` (không commit):
   ```bash
   JWT_KEY=your_secret_key_here_minimum_32_characters
   DB_PASSWORD=your_secure_password
   ```

2. Cập nhật `docker-compose.yml` để sử dụng `.env`:
   ```yaml
   environment:
     - Jwt__Key=${JWT_KEY}
     POSTGRES_PASSWORD: ${DB_PASSWORD}
   ```

## 📚 Thêm Thông Tin

- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)
- [ASP.NET Core in Docker](https://docs.microsoft.com/en-us/dotnet/core/docker/)
- [PostgreSQL Docker Image](https://hub.docker.com/_/postgres)

---

**Được tạo:** 2024
**Version:** 1.0
