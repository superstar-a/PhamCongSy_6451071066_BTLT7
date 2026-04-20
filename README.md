# BTChuong7 - Flutter HTTP/API

**MSSV:** 6451071066  
**Họ tên:** Phạm Công Sỹ

## Cấu trúc
Mỗi bài là 1 project Flutter độc lập nằm trong folder `01` → `07`.

```
lib/
├─ main.dart
├─ apps/        # App root widget
├─ controller/  # Gọi API, xử lý logic
├─ models/      # Model + fromJson/toJson
├─ views/       # Màn hình chính
├─ widget/      # Widget tái sử dụng (MssvBanner,...)
└─ utils/       # Constants (endpoints, thông tin SV)
```

## Nội dung các bài
| STT | Đề bài | API sử dụng |
|-----|--------|-------------|
| 01 | Fetch User List (GET) | https://jsonplaceholder.typicode.com/users |
| 02 | Product Detail (GET) | https://dummyjson.com/products/1 |
| 03 | Create Post (POST) | https://jsonplaceholder.typicode.com/posts |
| 04 | Update User Info (PUT) | https://jsonplaceholder.typicode.com/users/1 |
| 05 | Delete Task (DELETE) | https://jsonplaceholder.typicode.com/todos |
| 06 | Search Products (Query) | https://dummyjson.com/products/search?q= |
| 07 | Pull to Refresh | https://jsonplaceholder.typicode.com/posts |

## Cách chạy từng bài
Mở PowerShell tại thư mục của bài (ví dụ `d:\BTChuong7\01`) rồi chạy:

```powershell
flutter create .
flutter pub get
flutter run -d chrome   # hoặc -d windows / -d <deviceId>
```

> Lưu ý: `flutter create .` chỉ cần chạy lần đầu để sinh thư mục
> `android/`, `ios/`, `web/`, `windows/`... Sau đó các file trong
> `lib/` và `pubspec.yaml` đã có sẵn sẽ được sử dụng.

## Chụp ảnh nộp bài
- Ảnh phải thấy **MSSV + Họ tên** trên giao diện app (đã hiển thị sẵn ở banner vàng).
- Ảnh phải thấy **thanh taskbar Windows** của máy tính.
- Lưu ảnh vào chính folder của bài (ví dụ `d:\BTChuong7\01\ketqua.png`).
