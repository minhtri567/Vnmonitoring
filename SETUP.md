# Setup Hướng dẫn 🛠️

Để chạy dự án này trên máy của bạn, bạn cần cấu hình một số file nhạy cảm.

## 1. Cấu hình Backend (ASP.NET Core)

Sao chép file example:

```bash
cp appsettings.example.json Vnmonitoring.Server/appsettings.json
```

Sau đó chỉnh sửa `Vnmonitoring.Server/appsettings.json` với thông tin thực tế:

```json
{
  "Jwt": {
    "Key": "your-secret-key-minimum-32-characters-long-here",
    "Issuer": "VnmonitoringAPI",
    "Audience": "VnmonitoringClient"
  },
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Port=5432;Database=VnmonitoringDB;User Id=postgres;Password=YOUR_DB_PASSWORD;"
  },
  "SmtpSettings": {
    "Host": "smtp.gmail.com",
    "Port": 587,
    "User": "your-email@gmail.com",
    "Password": "your-app-specific-password",
    "From": "your-email@gmail.com"
  },
  "MyConfig": {
    "ApiKey": "your-external-api-key",
    "ApiBaseUrl": "http://your-api-url/path"
  }
}
```

**Lưu ý:** `appsettings.json` được ignore trong `.gitignore` để bảo vệ dữ liệu nhạy cảm.

## 2. Cấu hình Docker Compose

Sao chép file example:

```bash
cp docker-compose.example.yml docker-compose.yml
```

Sau đó chỉnh sửa `docker-compose.yml` với các thông tin nhạy cảm của bạn:

- `Jwt__Key`: JWT secret key (tối thiểu 32 ký tự)
- `ConnectionStrings__DefaultConnection`: Connection string cơ sở dữ liệu
- `POSTGRES_PASSWORD`: Mật khẩu PostgreSQL
- `MyConfig__ApiBaseUrl`: URL API bên ngoài

**Lưu ý:** `docker-compose.yml` được ignore để bảo vệ credentials.

### Chạy Docker:

```bash
docker-compose up -d
```

## 3. Biến môi trường Client (Tùy chọn)

Nếu cần, tạo file `.env` trong `vnmonitoring.client/`:

```
VITE_API_URL=/api
```

## 4. Database Setup

Khi chạy Docker, migration sẽ tự động chạy từ các file trong `init-data/`:
- `00-enable-extensions.sql` - Enable extensions
- `01-restore-data.sql` - Restore sample data

## Cấu trúc File Nhạy cảm

| File | Mục đích | Được Track? |
|------|---------|-----------|
| `appsettings.json` | ASP.NET Core config | ❌ Ignore |
| `docker-compose.yml` | Docker secrets | ❌ Ignore |
| `appsettings.example.json` | Template | ✅ Track |
| `docker-compose.example.yml` | Template | ✅ Track |

## Checklist trước khi Push GitHub

- [ ] Xóa file cấu hình thực tế khỏi git: `git rm --cached docker-compose.yml appsettings.json`
- [ ] Verify `.gitignore` chứa là những file nhạy cảm
- [ ] Kiểm tra không commit credentials: `git diff --cached`
- [ ] Copy example files thay vì file thực tế

## Khôi phục môi trường cục bộ

```bash
# Setup file config từ example
cp appsettings.example.json Vnmonitoring.Server/appsettings.json
cp docker-compose.example.yml docker-compose.yml

# Chỉnh sửa với thông tin thực tế của bạn
# Sau đó chạy
docker-compose up -d
```

---

**⚠️ QUAN TRỌNG**: Không bao giờ commit credentials, API keys, hoặc database passwords của bạn lên GitHub!
