using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace Vnmonitoring.Server.Models;

public partial class WeatherDataContext : DbContext
{
    public WeatherDataContext()
    {
    }

    public WeatherDataContext(DbContextOptions<WeatherDataContext> options)
        : base(options)
    {
    }

    public virtual DbSet<BgmapCommune> BgmapCommunes { get; set; }

    public virtual DbSet<BgmapProvince> BgmapProvinces { get; set; }

    public virtual DbSet<Hyper35Chunk> Hyper35Chunks { get; set; }

    public virtual DbSet<IwThongsoquantrac> IwThongsoquantracs { get; set; }

    public virtual DbSet<MapLayer> MapLayers { get; set; }

    public virtual DbSet<MapLayerCoquanAccess> MapLayerCoquanAccesses { get; set; }

    public virtual DbSet<MapLayerMemberAccess> MapLayerMemberAccesses { get; set; }

    public virtual DbSet<MapSource> MapSources { get; set; }

    public virtual DbSet<MapboxApikey> MapboxApikeys { get; set; }

    public virtual DbSet<MonitoringDatum> MonitoringData { get; set; }

    public virtual DbSet<MonitoringStation> MonitoringStations { get; set; }

    public virtual DbSet<SysCoquan> SysCoquans { get; set; }

    public virtual DbSet<SysDanhmuc> SysDanhmucs { get; set; }

    public virtual DbSet<SysDanhmucPhanloai> SysDanhmucPhanloais { get; set; }

    public virtual DbSet<SysFunction> SysFunctions { get; set; }

    public virtual DbSet<SysMember> SysMembers { get; set; }

    public virtual DbSet<SysRole> SysRoles { get; set; }

    public virtual DbSet<SysRoleCoquan> SysRoleCoquans { get; set; }

    public virtual DbSet<SysRoleMember> SysRoleMembers { get; set; }

    public virtual DbSet<WeatherStationsReport> WeatherStationsReports { get; set; }

    public virtual DbSet<WeatherStationsReportList> WeatherStationsReportLists { get; set; }


    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .HasPostgresExtension("timescaledb")
            .HasPostgresExtension("uuid-ossp");

        modelBuilder.Entity<BgmapCommune>(entity =>
        {
            entity.HasKey(e => e.Gid).HasName("bgmap_commune_pkey");

            entity.ToTable("bgmap_commune");

            entity.Property(e => e.Gid).HasColumnName("gid");
            entity.Property(e => e.TenXa)
                .HasMaxLength(200)
                .HasColumnName("ten_xa");
            entity.Property(e => e.TinhId).HasColumnName("tinh_id");

            entity.HasOne(d => d.Tinh).WithMany(p => p.BgmapCommunes)
                .HasForeignKey(d => d.TinhId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("fk_commune_province");
        });

        modelBuilder.Entity<BgmapProvince>(entity =>
        {
            entity.HasKey(e => e.Gid).HasName("bgmap_pk");

            entity.ToTable("bgmap_province");

            entity.Property(e => e.Gid)
                .HasDefaultValueSql("nextval('bgmap_ogc_fid_seq'::regclass)")
                .HasColumnName("gid");
            entity.Property(e => e.Code)
                .HasColumnType("character varying")
                .HasColumnName("code");
            entity.Property(e => e.TenTinh)
                .HasColumnType("character varying")
                .HasColumnName("ten_tinh");
            entity.Property(e => e.TinhSeo).HasColumnName("tinh_seo");
        });

        modelBuilder.Entity<Hyper35Chunk>(entity =>
        {
            entity.HasKey(e => new { e.TsktId, e.DataThoigian }).HasName("5_9_monitoring_data_pkey");

            entity.ToTable("_hyper_3_5_chunk", "_timescaledb_internal");

            entity.HasIndex(e => new { e.TsktId, e.DataThoigian }, "_hyper_3_5_chunk_idx_monitoring_data_tsktid_thoigian").IsDescending(false, true);

            entity.HasIndex(e => e.DataThoigian, "_hyper_3_5_chunk_monitoring_data_data_thoigian_idx").IsDescending();

            entity.Property(e => e.TsktId).HasColumnName("tskt_id");
            entity.Property(e => e.DataThoigian)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("data_thoigian");
            entity.Property(e => e.Createby)
                .HasMaxLength(150)
                .HasColumnName("createby");
            entity.Property(e => e.DataGiatriChuoi)
                .HasMaxLength(250)
                .HasColumnName("data_giatri_chuoi");
            entity.Property(e => e.DataGiatriSothuc)
                .HasDefaultValueSql("0")
                .HasColumnName("data_giatri_sothuc");
            entity.Property(e => e.DataId)
                .HasDefaultValueSql("nextval('monitoring_data_data_id_seq'::regclass)")
                .HasColumnName("data_id");
            entity.Property(e => e.DataMaloaithongso)
                .HasMaxLength(100)
                .HasColumnName("data_maloaithongso");
            entity.Property(e => e.DataThoigiancapnhat)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("data_thoigiancapnhat");
            entity.Property(e => e.DataTonghop)
                .HasMaxLength(250)
                .HasColumnName("data_tonghop");

            entity.HasOne(d => d.Tskt).WithMany(p => p.Hyper35Chunks)
                .HasForeignKey(d => d.TsktId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("5_10_monitoring_data_tskt_id_fkey");
        });

        modelBuilder.Entity<IwThongsoquantrac>(entity =>
        {
            entity.HasKey(e => e.TsktId).HasName("iw_thongsoquantrac_pkey");

            entity.ToTable("iw_thongsoquantrac");

            entity.HasIndex(e => e.StationId, "idx_tskt_station_id");

            entity.Property(e => e.TsktId).HasColumnName("tskt_id");
            entity.Property(e => e.NguonDulieu)
                .HasMaxLength(250)
                .HasColumnName("nguon_dulieu");
            entity.Property(e => e.StationId)
                .HasColumnType("character varying")
                .HasColumnName("station_id");
            entity.Property(e => e.TsktDeletedstatus).HasColumnName("tskt_deletedstatus");
            entity.Property(e => e.TsktKey)
                .HasDefaultValueSql("uuid_generate_v4()")
                .HasColumnName("tskt_key");
            entity.Property(e => e.TsktMaloaithongso)
                .HasMaxLength(450)
                .HasColumnName("tskt_maloaithongso");
            entity.Property(e => e.TsktNguongMax).HasColumnName("tskt_nguong_max");
            entity.Property(e => e.TsktNguongMin).HasColumnName("tskt_nguong_min");
            entity.Property(e => e.TsktNhaplieuthucong).HasColumnName("tskt_nhaplieuthucong");
            entity.Property(e => e.TsktStt).HasColumnName("tskt_stt");
            entity.Property(e => e.TsktTen)
                .HasMaxLength(450)
                .HasColumnName("tskt_ten");

            entity.HasOne(d => d.Station).WithMany(p => p.IwThongsoquantracs)
                .HasPrincipalKey(p => p.StationId)
                .HasForeignKey(d => d.StationId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("fk_station_id");
        });

        modelBuilder.Entity<MapLayer>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("map_layers_pkey");

            entity.ToTable("map_layers");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Filter).HasColumnName("filter");
            entity.Property(e => e.IsGroup)
                .HasDefaultValue(false)
                .HasColumnName("is_group");
            entity.Property(e => e.IsPublic)
                .HasDefaultValue(false)
                .HasColumnName("is_public");
            entity.Property(e => e.LayerType)
                .HasMaxLength(20)
                .HasColumnName("layer_type");
            entity.Property(e => e.Layout).HasColumnName("layout");
            entity.Property(e => e.MaxZoom).HasColumnName("max_zoom");
            entity.Property(e => e.MinZoom).HasColumnName("min_zoom");
            entity.Property(e => e.Name)
                .HasMaxLength(150)
                .HasColumnName("name");
            entity.Property(e => e.Paint)
                .HasColumnType("jsonb")
                .HasColumnName("paint");
            entity.Property(e => e.ParentId).HasColumnName("parent_id");
            entity.Property(e => e.SortOrder).HasColumnName("sort_order");
            entity.Property(e => e.SourceId).HasColumnName("source_id");
            entity.Property(e => e.SourceLayer)
                .HasMaxLength(50)
                .HasColumnName("source_layer");
            entity.Property(e => e.VisibleByDefault)
                .HasDefaultValue(true)
                .HasColumnName("visible_by_default");

            entity.HasOne(d => d.Parent).WithMany(p => p.InverseParent)
                .HasForeignKey(d => d.ParentId)
                .OnDelete(DeleteBehavior.SetNull)
                .HasConstraintName("map_layers_parent_id_fkey");

            entity.HasOne(d => d.Source).WithMany(p => p.MapLayers)
                .HasForeignKey(d => d.SourceId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("map_layers_source_id_fkey");
        });

        modelBuilder.Entity<MapLayerCoquanAccess>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("map_layer_coquan_access_pkey");

            entity.ToTable("map_layer_coquan_access");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CqId).HasColumnName("cq_id");
            entity.Property(e => e.LayerId).HasColumnName("layer_id");

            entity.HasOne(d => d.Cq).WithMany(p => p.MapLayerCoquanAccesses)
                .HasForeignKey(d => d.CqId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("map_layer_coquan_access_cq_id_fkey");

            entity.HasOne(d => d.Layer).WithMany(p => p.MapLayerCoquanAccesses)
                .HasForeignKey(d => d.LayerId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("map_layer_coquan_access_layer_id_fkey");
        });

        modelBuilder.Entity<MapLayerMemberAccess>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("map_layer_member_access_pkey");

            entity.ToTable("map_layer_member_access");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.LayerId).HasColumnName("layer_id");
            entity.Property(e => e.MemId).HasColumnName("mem_id");

            entity.HasOne(d => d.Layer).WithMany(p => p.MapLayerMemberAccesses)
                .HasForeignKey(d => d.LayerId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("map_layer_member_access_layer_id_fkey");

            entity.HasOne(d => d.Mem).WithMany(p => p.MapLayerMemberAccesses)
                .HasForeignKey(d => d.MemId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("map_layer_member_access_mem_id_fkey");
        });

        modelBuilder.Entity<MapSource>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("map_sources_pkey");

            entity.ToTable("map_sources");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Active)
                .HasDefaultValue(false)
                .HasColumnName("active");
            entity.Property(e => e.ApikeyId).HasColumnName("apikey_id");
            entity.Property(e => e.Bounds)
                .HasColumnType("jsonb")
                .HasColumnName("bounds");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.Name)
                .HasMaxLength(150)
                .HasColumnName("name");
            entity.Property(e => e.Scheme)
                .HasColumnType("character varying")
                .HasColumnName("scheme");
            entity.Property(e => e.SourceType)
                .HasMaxLength(20)
                .HasColumnName("source_type");
            entity.Property(e => e.SourceUrl).HasColumnName("source_url");

            entity.HasOne(d => d.Apikey).WithMany(p => p.MapSources)
                .HasForeignKey(d => d.ApikeyId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("map_sources_apikey_id_fkey");
        });

        modelBuilder.Entity<MapboxApikey>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("mapbox_apikeys_pkey");

            entity.ToTable("mapbox_apikeys");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.Active)
                .HasDefaultValue(true)
                .HasColumnName("active");
            entity.Property(e => e.CreatedAt)
                .HasDefaultValueSql("now()")
                .HasColumnType("timestamp without time zone")
                .HasColumnName("created_at");
            entity.Property(e => e.CreatedBy)
                .HasMaxLength(100)
                .HasColumnName("created_by");
            entity.Property(e => e.Description).HasColumnName("description");
            entity.Property(e => e.KeyValue).HasColumnName("key_value");
        });

        modelBuilder.Entity<MonitoringDatum>(entity =>
        {
            entity.HasKey(e => new { e.TsktId, e.DataThoigian }).HasName("monitoring_data_pkey");

            entity.ToTable("monitoring_data");

            entity.HasIndex(e => new { e.TsktId, e.DataThoigian }, "idx_monitoring_data_tsktid_thoigian").IsDescending(false, true);

            entity.HasIndex(e => e.DataThoigian, "monitoring_data_data_thoigian_idx").IsDescending();

            entity.Property(e => e.TsktId).HasColumnName("tskt_id");
            entity.Property(e => e.DataThoigian)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("data_thoigian");
            entity.Property(e => e.Createby)
                .HasMaxLength(150)
                .HasColumnName("createby");
            entity.Property(e => e.DataGiatriChuoi)
                .HasMaxLength(250)
                .HasColumnName("data_giatri_chuoi");
            entity.Property(e => e.DataGiatriSothuc)
                .HasDefaultValueSql("0")
                .HasColumnName("data_giatri_sothuc");
            entity.Property(e => e.DataId)
                .ValueGeneratedOnAdd()
                .HasColumnName("data_id");
            entity.Property(e => e.DataMaloaithongso)
                .HasMaxLength(100)
                .HasColumnName("data_maloaithongso");
            entity.Property(e => e.DataThoigiancapnhat)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("data_thoigiancapnhat");
            entity.Property(e => e.DataTonghop)
                .HasMaxLength(250)
                .HasColumnName("data_tonghop");

            entity.HasOne(d => d.Tskt).WithMany(p => p.MonitoringData)
                .HasForeignKey(d => d.TsktId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("monitoring_data_tskt_id_fkey");
        });

        modelBuilder.Entity<MonitoringStation>(entity =>
        {
            entity.HasKey(e => e.Key).HasName("monitoring_stations_pkey");

            entity.ToTable("monitoring_stations");

            entity.HasIndex(e => e.CommuneId, "idx_station_commune_id");

            entity.HasIndex(e => e.StationId, "monitoring_stations_station_id_key").IsUnique();

            entity.Property(e => e.Key)
                .HasDefaultValueSql("uuid_generate_v4()")
                .HasColumnName("key");
            entity.Property(e => e.CommuneId).HasColumnName("commune_id");
            entity.Property(e => e.CreateAt)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("create_at");
            entity.Property(e => e.CreateBy)
                .HasMaxLength(100)
                .HasColumnName("create_by");
            entity.Property(e => e.DeleteAt)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("delete_at");
            entity.Property(e => e.DeleteBy)
                .HasMaxLength(100)
                .HasColumnName("delete_by");
            entity.Property(e => e.Description)
                .HasColumnType("character varying")
                .HasColumnName("description");
            entity.Property(e => e.InforData)
                .HasColumnType("jsonb")
                .HasColumnName("infor_data");
            entity.Property(e => e.Lat).HasColumnName("lat");
            entity.Property(e => e.Lon).HasColumnName("lon");
            entity.Property(e => e.Luuvuc)
                .HasColumnType("character varying")
                .HasColumnName("luuvuc");
            entity.Property(e => e.StationId)
                .HasColumnType("character varying")
                .HasColumnName("station_id");
            entity.Property(e => e.StationName)
                .HasColumnType("character varying")
                .HasColumnName("station_name");
            entity.Property(e => e.UpdateAt)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("update_at");
            entity.Property(e => e.UpdateBy)
                .HasMaxLength(100)
                .HasColumnName("update_by");

            entity.HasOne(d => d.Commune).WithMany(p => p.MonitoringStations)
                .HasForeignKey(d => d.CommuneId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("monitoring_stations_commune_id_fkey");
        });

        modelBuilder.Entity<SysCoquan>(entity =>
        {
            entity.HasKey(e => e.CqId).HasName("sys_coquan_pkey");

            entity.ToTable("sys_coquan");

            entity.Property(e => e.CqId).HasColumnName("cq_id");
            entity.Property(e => e.CqActive)
                .HasDefaultValue(true)
                .HasColumnName("cq_active");
            entity.Property(e => e.CqDiachi)
                .HasMaxLength(450)
                .HasColumnName("cq_diachi");
            entity.Property(e => e.CqDienthoai)
                .HasMaxLength(150)
                .HasColumnName("cq_dienthoai");
            entity.Property(e => e.CqEmail)
                .HasMaxLength(150)
                .HasColumnName("cq_email");
            entity.Property(e => e.CqGhichu)
                .HasMaxLength(450)
                .HasColumnName("cq_ghichu");
            entity.Property(e => e.CqLoai)
                .HasMaxLength(150)
                .HasColumnName("cq_loai");
            entity.Property(e => e.CqMota)
                .HasMaxLength(450)
                .HasColumnName("cq_mota");
            entity.Property(e => e.CqNguoidaidien)
                .HasMaxLength(450)
                .HasColumnName("cq_nguoidaidien");
            entity.Property(e => e.CqPid).HasColumnName("cq_pid");
            entity.Property(e => e.CqStt).HasColumnName("cq_stt");
            entity.Property(e => e.CqTen)
                .HasMaxLength(450)
                .HasColumnName("cq_ten");
            entity.Property(e => e.CqTinhid).HasColumnName("cq_tinhid");
            entity.Property(e => e.CqXaid).HasColumnName("cq_xaid");
        });

        modelBuilder.Entity<SysDanhmuc>(entity =>
        {
            entity.HasKey(e => e.DmId).HasName("sys_danhmuc_pkey");

            entity.ToTable("sys_danhmuc");

            entity.Property(e => e.DmId).HasColumnName("dm_id");
            entity.Property(e => e.DmIconUrl)
                .HasMaxLength(250)
                .HasColumnName("dm_icon_url");
            entity.Property(e => e.DmLdmId).HasColumnName("dm_ldm_id");
            entity.Property(e => e.DmMa)
                .HasMaxLength(150)
                .HasColumnName("dm_ma");
            entity.Property(e => e.DmMota)
                .HasMaxLength(1000)
                .HasColumnName("dm_mota");
            entity.Property(e => e.DmPid).HasColumnName("dm_pid");
            entity.Property(e => e.DmStt).HasColumnName("dm_stt");
            entity.Property(e => e.DmTen)
                .HasMaxLength(150)
                .HasColumnName("dm_ten");
            entity.Property(e => e.Functionid).HasColumnName("functionid");

            entity.HasOne(d => d.DmLdm).WithMany(p => p.SysDanhmucs)
                .HasForeignKey(d => d.DmLdmId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("sys_danhmuc_dm_ldm_id_fkey");

            entity.HasOne(d => d.Function).WithMany(p => p.SysDanhmucs)
                .HasForeignKey(d => d.Functionid)
                .HasConstraintName("fk_sys_danhmuc_function");
        });

        modelBuilder.Entity<SysDanhmucPhanloai>(entity =>
        {
            entity.HasKey(e => e.LdmId).HasName("sys_danhmuc_phanloai_pkey");

            entity.ToTable("sys_danhmuc_phanloai");

            entity.Property(e => e.LdmId).HasColumnName("ldm_id");
            entity.Property(e => e.LdmMa)
                .HasMaxLength(150)
                .HasColumnName("ldm_ma");
            entity.Property(e => e.LdmMota)
                .HasColumnType("character varying")
                .HasColumnName("ldm_mota");
            entity.Property(e => e.LdmPid).HasColumnName("ldm_pid");
            entity.Property(e => e.LdmStt).HasColumnName("ldm_stt");
            entity.Property(e => e.LdmTen)
                .HasMaxLength(200)
                .HasColumnName("ldm_ten");
            entity.Property(e => e.LdmUrl)
                .HasMaxLength(250)
                .HasColumnName("ldm_url");
        });

        modelBuilder.Entity<SysFunction>(entity =>
        {
            entity.HasKey(e => e.FnId).HasName("sys_function_pkey");

            entity.ToTable("sys_function");

            entity.Property(e => e.FnId).HasColumnName("fn_id");
            entity.Property(e => e.FnActive).HasColumnName("fn_active");
            entity.Property(e => e.FnDmid).HasColumnName("fn_dmid");
            entity.Property(e => e.FnMa)
                .HasMaxLength(50)
                .HasColumnName("fn_ma");
            entity.Property(e => e.FnMota)
                .HasMaxLength(500)
                .HasColumnName("fn_mota");
            entity.Property(e => e.FnNgaycapnhat)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("fn_ngaycapnhat");
            entity.Property(e => e.FnNgaytao)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("fn_ngaytao");
            entity.Property(e => e.FnNguoitao)
                .HasMaxLength(50)
                .HasColumnName("fn_nguoitao");
            entity.Property(e => e.FnTen)
                .HasMaxLength(500)
                .HasColumnName("fn_ten");
            entity.Property(e => e.FnThutu).HasColumnName("fn_thutu");
            entity.Property(e => e.FnUrl)
                .HasMaxLength(250)
                .HasColumnName("fn_url");
        });

        modelBuilder.Entity<SysMember>(entity =>
        {
            entity.HasKey(e => e.MemId).HasName("sys_member_pkey");

            entity.ToTable("sys_member");

            entity.HasIndex(e => e.MemUsername, "unique_username").IsUnique();

            entity.Property(e => e.MemId)
                .HasDefaultValueSql("uuid_generate_v4()")
                .HasColumnName("mem_id");
            entity.Property(e => e.MemActive).HasColumnName("mem_active");
            entity.Property(e => e.MemCqId).HasColumnName("mem_cq_id");
            entity.Property(e => e.MemCreateAt)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("mem_create_at");
            entity.Property(e => e.MemDeleteAt)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("mem_delete_at");
            entity.Property(e => e.MemDeleteBy)
                .HasMaxLength(150)
                .HasColumnName("mem_delete_by");
            entity.Property(e => e.MemEmail)
                .HasMaxLength(150)
                .HasColumnName("mem_email");
            entity.Property(e => e.MemHoten)
                .HasMaxLength(450)
                .HasColumnName("mem_hoten");
            entity.Property(e => e.MemLastloginAt)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("mem_lastlogin_at");
            entity.Property(e => e.MemPassword)
                .HasMaxLength(450)
                .HasColumnName("mem_password");
            entity.Property(e => e.MemUpdateAt)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("mem_update_at");
            entity.Property(e => e.MemUpdateBy)
                .HasMaxLength(150)
                .HasColumnName("mem_update_by");
            entity.Property(e => e.MemUsername)
                .HasMaxLength(150)
                .HasColumnName("mem_username");

            entity.HasOne(d => d.MemCq).WithMany(p => p.SysMembers)
                .HasForeignKey(d => d.MemCqId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("sys_member_mem_cq_id_fkey");
        });

        modelBuilder.Entity<SysRole>(entity =>
        {
            entity.HasKey(e => e.RoleId).HasName("sys_role_pkey");

            entity.ToTable("sys_role");

            entity.Property(e => e.RoleId).HasColumnName("role_id");
            entity.Property(e => e.RoleMa)
                .HasMaxLength(150)
                .HasColumnName("role_ma");
            entity.Property(e => e.RoleNguoitao)
                .HasMaxLength(150)
                .HasColumnName("role_nguoitao");
            entity.Property(e => e.RoleStt).HasColumnName("role_stt");
            entity.Property(e => e.RoleTen)
                .HasMaxLength(150)
                .HasColumnName("role_ten");
            entity.Property(e => e.RoleType).HasColumnName("role_type");
        });

        modelBuilder.Entity<SysRoleCoquan>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("sys_role_coquan_pkey");

            entity.ToTable("sys_role_coquan");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CqId).HasColumnName("cq_id");
            entity.Property(e => e.RoleId).HasColumnName("role_id");

            entity.HasOne(d => d.Cq).WithMany(p => p.SysRoleCoquans)
                .HasForeignKey(d => d.CqId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("sys_role_coquan_cq_id_fkey");

            entity.HasOne(d => d.Role).WithMany(p => p.SysRoleCoquans)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("sys_role_coquan_role_id_fkey");
        });

        modelBuilder.Entity<SysRoleMember>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("sys_role_member_pkey");

            entity.ToTable("sys_role_member");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.MemId).HasColumnName("mem_id");
            entity.Property(e => e.RoleId).HasColumnName("role_id");

            entity.HasOne(d => d.Mem).WithMany(p => p.SysRoleMembers)
                .HasForeignKey(d => d.MemId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("sys_role_member_mem_id_fkey");

            entity.HasOne(d => d.Role).WithMany(p => p.SysRoleMembers)
                .HasForeignKey(d => d.RoleId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("sys_role_member_role_id_fkey");
        });

        modelBuilder.Entity<WeatherStationsReport>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("weather_stations_report_pkey");

            entity.ToTable("weather_stations_report");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.CreatedBy).HasColumnName("created_by");
            entity.Property(e => e.Email)
                .HasColumnType("character varying")
                .HasColumnName("email");
            entity.Property(e => e.FileRef)
                .HasColumnType("character varying")
                .HasColumnName("file_ref");
            entity.Property(e => e.IsPublic)
                .HasDefaultValue(false)
                .HasColumnName("is_public");
            entity.Property(e => e.NameFile)
                .HasColumnType("character varying")
                .HasColumnName("name_file");
            entity.Property(e => e.Ngaybatdau)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("ngaybatdau");
            entity.Property(e => e.Ngayketthuc)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("ngayketthuc");
            entity.Property(e => e.RequestTime)
                .HasColumnType("timestamp without time zone")
                .HasColumnName("request_time");
            entity.Property(e => e.RpType)
                .HasColumnType("character varying")
                .HasColumnName("rp_type");
            entity.Property(e => e.Tansuat)
                .HasColumnType("character varying")
                .HasColumnName("tansuat");
            entity.Property(e => e.Trangthai).HasColumnName("trangthai");

            entity.HasOne(d => d.CreatedByNavigation).WithMany(p => p.WeatherStationsReports)
                .HasForeignKey(d => d.CreatedBy)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("weather_stations_report_created_by_fkey");
        });

        modelBuilder.Entity<WeatherStationsReportList>(entity =>
        {
            entity.HasKey(e => e.Id).HasName("weather_stations_report_list_pkey");

            entity.ToTable("weather_stations_report_list");

            entity.Property(e => e.Id).HasColumnName("id");
            entity.Property(e => e.ProvineId).HasColumnName("provine_id");
            entity.Property(e => e.StationId)
                .HasColumnType("character varying")
                .HasColumnName("station_id");
            entity.Property(e => e.WeatherStationsReportId).HasColumnName("weather_stations_report_id");

            entity.HasOne(d => d.Station).WithMany(p => p.WeatherStationsReportLists)
                .HasPrincipalKey(p => p.StationId)
                .HasForeignKey(d => d.StationId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("weather_stations_report_list_station_id_fkey");

            entity.HasOne(d => d.WeatherStationsReport).WithMany(p => p.WeatherStationsReportLists)
                .HasForeignKey(d => d.WeatherStationsReportId)
                .OnDelete(DeleteBehavior.Cascade)
                .HasConstraintName("weather_stations_report_list_weather_stations_report_id_fkey");
        });
        modelBuilder.HasSequence("chunk_constraint_name", "_timescaledb_catalog");

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
