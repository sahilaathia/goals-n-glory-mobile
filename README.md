## Tugas Individu 7

### 1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree adalah representasi dari semua UI (User Interface) widget dalam bentuk struktur pohon (tree). Setiap widget direpresentasikan sebagai node dalam pohon tersebut.

Hubungan Parent-Child:
- Widget parent (induk) dapat memiliki satu atau lebih widget child (anak)
- Child widget menerima deskripsi/properti dari parent widget
- Perubahan pada parent akan mempengaruhi childnya
- Widget tree digunakan saat layout (pengukuran & struktur), rendering (tampilan ke layar), dan hit testing (interaksi sentuh)

Contoh dari kode:
```
MyHomePage (parent)
├── Scaffold (child dari MyHomePage)
    ├── AppBar (child dari Scaffold)
    └── Body dengan Column (child dari Scaffold)
        ├── Row dengan InfoCard (child dari Column)
        └── GridView dengan ItemCard (child dari Column)
```

### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
| Widget | Fungsi |
| --- | --- |
| `MaterialApp` | Mengatur tema, navigasi, dan konfigurasi global aplikasi |
| `Scaffold` | Menyediakan struktur dasar halaman (`AppBar`, `body`, dll) |
| `AppBar` | Bar di bagian atas halaman untuk menampilkan judul |
| `Text` | Menampilkan teks |
| `Padding` | Memberikan jarak/padding di sekitar widget |
| `Column` | Menyusun widget secara vertikal |
| `Row` | Menyusun widget secara horizontal |
| `Card` | Membuat kotak kartu dengan bayangan |
| `Container` | Wadah untuk menyimpan dan mengatur widget lain |
| `GridView.count` | Menampilkan widget dalam bentuk grid dengan jumlah kolom tetap |
| `Material` | Memberikan efek material design (warna, bentuk) |
| `InkWell` | Mendeteksi gestur tap dan memberikan efek ripple |
| `Icon` | Menampilkan icon |
| `Center` | Menempatkan widget di tengah |
| `SizedBox` | Memberikan jarak/spacing kosong |
| `SnackBar` | Menampilkan notifikasi pop-up dari bawah layar |

### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Fungsi MaterialApp:
- Menyediakan struktur dasar aplikasi dengan Material Design
- Mengatur tema, navigasi, dan konfigurasi aplikasi
- Menyediakan widget-widget Material Design seperti Scaffold, AppBar, dll

Mengapa sering digunakan sebagai root widget?
- Memberikan konsistensi desain mengikuti Material Design Guidelines (Google)
- Menyediakan fitur navigasi dan routing built-in
- Mengatur tema global aplikasi (warna, font, dll)
- Menjadi wrapper yang diperlukan untuk menggunakan widget Material Design lainnya
- Dipanggil melalui runApp(MyApp()) sebagai titik awal aplikasi Flutter

### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
StatelessWidget:
- Tidak memiliki state yang bisa berubah secara internal
- Hanya berubah jika ada perubahan dari parent widget (eksternal)
- Memiliki properti final yang didefinisikan saat konstruksi
- Lebih ringan dan efisien
- Kapan digunakan: Untuk UI yang statis/tidak berubah (contoh: teks judul, ikon, label)

StatefulWidget:
- Memiliki state yang bisa berubah dinamis selama lifetime-nya
- Widget immutable, tapi memiliki State class yang mutable
- Dapat mengubah tampilannya sendiri melalui internal action
- Kapan digunakan: Untuk UI yang dinamis/interaktif (contoh: form input, counter, animasi, data yang berubah)

Dalam project ini MyHomePage menggunakan StatelessWidget karena hanya menampilkan data statis (nama, NPM, kelas) tanpa perubahan state.

### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
Apa itu BuildContext?
- Objek yang merepresentasikan lokasi widget dalam widget tree
- Menyimpan referensi ke posisi widget dalam hierarki
- Diberikan secara otomatis sebagai parameter di method build()

Mengapa penting?
- Digunakan untuk mengakses widget parent di atas tree (seperti Theme, MediaQuery)
- Memungkinkan navigasi antar halaman
- Menampilkan SnackBar, Dialog, dan overlay lainnya
- Mengakses InheritedWidget (seperti Theme.of(context))

Penggunaan di method build:
```
Widget build(BuildContext context) {
  // Mengakses tema aplikasi
  Theme.of(context).colorScheme.primary
  
  // Menampilkan SnackBar
  ScaffoldMessenger.of(context).showSnackBar(...)
  
  // Mengakses ukuran layar
  MediaQuery.of(context).size.width
}
```

### 6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot Reload (Ctrl+\\):
- Memuat perubahan kode ke VM dan rebuild widget tree
- Mempertahankan state aplikasi (data tidak hilang)
- Tidak menjalankan ulang main() atau initState()
- Sangat cepat (dalam hitungan detik)
- Cocok untuk perubahan UI/tampilan

Hot Restart (Shift+Ctrl+\\):
- Memuat perubahan kode dan restart aplikasi Flutter
- State aplikasi hilang (reset ke kondisi awal)
- Menjalankan ulang main() dan initState()
- Lebih lambat dari hot reload
- Diperlukan untuk perubahan struktur/logika yang signifikan

Flutter web mendukung hot restart tapi tidak hot reload.

## Tugas Individu 8

### 1. Perbedaan Navigator.push() dan Navigator.pushReplacement() pada Flutter

Navigator.push():
- Menambahkan route baru di atas stack tanpa menghapus route sebelumnya
- Route lama tetap ada di bawah stack
- User bisa kembali ke halaman sebelumnya dengan tombol back
- Penggunaan di aplikasi: Navigasi dari homepage ke form tambah produk, karena user perlu bisa kembali ke homepage setelah mengisi form

Navigator.pushReplacement():
- Mengganti route yang sedang ditampilkan dengan route baru
- Route lama dihapus dari stack
- User tidak bisa kembali ke halaman sebelumnya dengan tombol back
- Penggunaan di aplikasi: Navigasi dari drawer menu ke homepage, karena tidak perlu menyimpan history halaman menu dalam stack

### 2. Pemanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten.

- Scaffold: Widget dasar yang menyediakan struktur visual Material Design dengan AppBar, body, dan drawer
  ```
  Scaffold(
    appBar: AppBar(...),
    drawer: LeftDrawer(),
    body: ...
  )
  ```
- AppBar: Header konsisten di setiap halaman dengan title dan styling yang sama
- Drawer: Menu navigasi yang konsisten di semua halaman, memudahkan user berpindah halaman dengan pattern yang sama

Dengan struktur ini, setiap halaman memiliki layout yang seragam dan konsisten: AppBar di atas, Drawer yang muncul dari samping, dan konten di body.

### 3. Kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView untuk form.

Padding:
- Memberikan jarak/ruang di sekitar setiap input field agar tidak berhimpitan
- Membuat form lebih rapi dan mudah dibaca
- Contoh di aplikasi: Semua TextFormField di `product_form.dart` dibungkus `Padding` dengan `EdgeInsets.all(8.0)` untuk memberikan jarak konsisten antar field
```
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      labelText: "Product Name",
      ...
    ),
  ),
),
```

SingleChildScrollView:
- Memungkinkan form di-scroll ketika konten melebihi tinggi layar
- Mencegah field terpotong atau tidak bisa diakses di layar kecil
- Contoh di aplikasi: Membungkus `Column` di `product_form.dart` yang berisi semua form field
```
body: Form(
  key: _formKey,
  child: SingleChildScrollView(
    child: Column(
      children: [
        // input fields
      ],
    ),
  ),
),
```

ListView:
- Efisien untuk menampilkan list item yang dinamis
- Lazy loading. Hanya render item yang terlihat
- Contoh di aplikasi: Digunakan di LeftDrawer (`left_drawer.dart`) untuk menampilkan menu navigasi
```
Drawer(
  child: ListView(
    children: [
      DrawerHeader(...),
      ListTile(...), // Home
      ListTile(...), // Add Product
    ],
  ),
)
```

Kombinasi ketiga layout ini membuat form `ProductFormPage` yang panjang tetap user-friendly, rapi dengan spacing konsisten, dan bisa diakses dengan smooth scrolling di berbagai ukuran layar.

### 4. Cara menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten.

Menggunakan `ThemeData` di `MaterialApp`, yang mana pada project ini di-define di `main.dart`, untuk konsistensi warna di seluruh aplikasi.
```
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
    .copyWith(secondary: Colors.tealAccent[400])
  ),
  ...
)
```

Untuk menggunakan warna tema aplikasi pada suatu bagian, hanya perlu memanggil `Theme.of(context).colorScheme.primary`/`secondary`.

Contoh penggunaan:
```
AppBar(
  title: Text('Goals n\' Glory'),
  backgroundColor: Theme.of(context).colorScheme.primary,
)
...
```

## Tugas Individu 9

### 1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?

Model Dart perlu dibuat karena ketika melakukan request ke web service dengan method GET, kita mendapat hasil berupa JSON. Model diperlukan untuk melakukan konversi data dengan method fromJson() agar Flutter dapat mengenali JSON tersebut sebagai objek dari class yang kita buat.

Konsekuensi tanpa model (langsung Map<String, dynamic>):
- Validasi tipe tidak ada
  - Dengan Map<String, dynamic>, semua value bertipe dynamic → tidak ada compile-time checking → error baru muncul saat runtime
- Null-Safety bermasalah
  - Tidak ada jaminan field tertentu ada atau tidak → rawan null error saat mengakses data → harus manual cek null di setiap akses data
- Maintainability buruk
  - Kode sulit dibaca dan typo field name tidak terdeteksi compiler, sehingga refactoring akan sangat sulit karena tidak bisa track penggunaan field

### 2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.

- Package http: Digunakan untuk melakukan HTTP requests sederhana (GET, POST, PUT, DELETE) ke web service tanpa autentikasi
- CookieRequest: Digunakan untuk aplikasi yang terintegrasi dengan Django authentication system (seperti project ini), menjaga user tetap login

|  | http Package | CookieRequest 
| --- | --- | --- |
| Session Management | Tidak ada | Otomatis |
| Cookie Handling | Manual | Otomatis tersimpan dan dikirim |
| Autentikasi | Harus kirim token di setiap request | Cookie otomatis dikirim setiap request |
| Integrasi Django | Perlu konfigurasi manual | Dirancang khusus untuk Django |
| Use Case | API publik, fetch data tanpa auth | Aplikasi dengan login Django |
| State | Stateless | Stateful (menyimpan session) |

### 3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

- Single Source of Truth
  - Satu instance = satu session untuk seluruh app, sehingga status login konsisten di semua page dan cookie autentikasi sama untuk semua request
- Mencegah login berulang
  - Jika tiap komponen buat instance baru → session berbeda, user harus login berkali-kali di page yang berbeda yang menyebabkan data user bisa tidak sinkron antar page
- Efisiensi memory
  - Tidak perlu buat instance baru di setiap widget. Cookie disimpan sekali, dipakai berkali-kali

Jika tidak dibagikan: User login di MyHomePage → pindah ke MyProductEntryListPage → dianggap belum login karena beda instance.

### 4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?

Konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django:
- Menambahkan 10.0.2.2 di ALLOWED_HOSTS
  - Mengapa diperlukan? 10.0.2.2 adalah alamat IP khusus Android Emulator untuk mengakses localhost komputer host. Django hanya menerima request dari host yang terdaftar di ALLOWED_HOSTS (security feature)
  - Jika tidak dikonfigurasi: Django akan menolak request dari emulator, error 400 Bad Request dengan pesan "DisallowedHost"
- Mengaktifkan CORS (django-cors-headers)
  - Mengapa diperlukan? CORS (Cross-Origin Resource Sharing) adalah security mechanism browser, Flutter app dan Django server adalah "origin" yang berbeda, tanpa CORS headers, browser/mobile akan memblokir request untuk keamanan
    - CORS_ALLOW_CREDENTIALS = True diperlukan agar cookie bisa dikirim cross-origin
  - Jika tidak dikonfigurasi: request diblokir, CORS Policy Error: "Access to fetch at '...' has been blocked by CORS policy"
- Pengaturan SameSite / secure cookie
  - Mengapa diperlukan?
    - *_SAMESITE = 'None': Mengizinkan cookie dikirim dari aplikasi mobile (cross-site)
    - *_SECURE = True: Cookie hanya dikirim melalui HTTPS (untuk production)
    - Default SAMESITE adalah 'Lax' atau 'Strict' yang akan memblokir cookie dari mobile app
  - Jika tidak dikonfigurasi: Cookie tidak tersimpan/terkirim → user logout terus-menerus → harus login ulang setiap request
- Menambahkan izin akses internet pada Android
  - Mengapa diperlukan? Android secara default MEMBLOKIR semua akses internet untuk keamanan. Permission ini memberikan izin eksplisit ke aplikasi untuk mengakses internet
  - Jika tidak dikonfigurasi: Semua HTTP request gagal dengan error "Network unreachable" atau "Socket exception"
- Menambahkan CSRF Exempt untuk API Endpoints
  - Mengapa diperlukan? Django secara default memerlukan CSRF token untuk semua POST request sebagai proteksi keamanan. Flutter tidak otomatis mengirim CSRF token seperti form HTML biasa, @csrf_exempt menonaktifkan CSRF check untuk endpoint API yang diakses Flutter
  - Jika tidak dikonfigurasi: Error 403 Forbidden dengan pesan "CSRF verification failed"

### 5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Alur untuk CREATE:
1. User mengisi form di Flutter
2. Validasi form
3. Convert ke JSON
4. Mengirim HTTP POST request
5. Django menerima request
6. Parse dan validasi di Django
7. Simpan ke database
8. Mengirim response JSON
9. Flutter menerima response
10. Menampilkan feedback

### 6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Register:
- Flutter - RegisterPage (register.dart)
  - User mengisi form (Username, Password, Confirm Password)
  - User klik tombol "Register"
  - onPressed() method dijalankan
  - Kirim POST request dengan jsonEncode
- Django - authentication/views.py
  - @csrf_exempt decorator: Skip CSRF check
  - Parse JSON body
  - Validasi Username sudah ada dan Password match (Confirm Password)
  - Buat user baru di database
  - Return success response JSON
- Flutter - RegisterPage
  - Cek response status melakukan action yang sesuai

Login:
- Flutter - LoginPage (login.dart)
  - User mengisi form
  - User klik tombol "Login"
  - onPressed() async method
  - Panggil CookieRequest.login(): POST request dengan data form dan siap menyimpan cookie
- Django - authentication/views.py
  - @csrf_exempt decorator: Skip CSRF check
  - Extract credentials dari POST data
  - Autentikasi dengan Django auth system (query database sesuai username, verify password hash, return)
  - Cek hasil autentikasi
  - Login user (buat Session)
  - Return success response JSON dengan Set-Cookie header
- Flutter - CookieRequest Internal Processing
  - Extract Set-Cookie dari response header
  - Simpan cookie di memory
  - Set loggedIn = true
- Flutter - LoginPage
  - Cek login status dan melakukan action yang sesuai

Logout:
- Flutter: User klik "Logout" → CookieRequest.logout() → kirim POST dengan cookie
- Django: Terima request → auth_logout() → hapus session → return success
- CookieRequest: Clear cookie dari memory → set loggedIn = false
- Flutter: Show message → pushReplacement ke LoginPage
- User logged out, harus login lagi untuk akses aplikasi

### 7. Step-by-step implementasi checklist Tugas 9:
Pada Project Django (`goals-n-glory`):
- Membuat app baru dengan nama `authentication`
- Menginstal library `django-cors-headers` dengan menambahkannya ke `requirements.txt` dan menjalankan `pip install`
- Menambahkan `corsheaders` ke INSTALLED_APPS dan `corsheaders.middleware.CorsMiddleware` ke MIDDLEWARE pada `settings.py`
- Menambahkan variabel-variabel baru pada `settings.py`
- Menambahkan `10.0.2.2` pada ALLOWED_HOSTS di `settings.py` untuk keperluan emulator Android
- Membuat fungsi `login`, `register`, `logout` di `authentication/views.py`
- Menambahkan path `'login/'`, `'register/'`, dan `'logout/'` untuk fungsi login, register, dan logout pada `authentication/urls.py`
- Menambahkan path `'auth/'` yang meng-include `authentication.urls` pada main project `urls.py`

Pada Project Flutter (`goals_n_glory_mobile`):
- Menjalankan perintah `flutter pub add provider` dan `flutter pub add pbp_django_auth` di root directory
- Memodifikasi file `main.dart` untuk menambahkan root widget `Provider` yang menyediakan instance `CookieRequest`
- Membuat file `login.dart` di `lib/screens/` yang berisi class `LoginPage` dan  `LoginApp`
- Mengubah home pada widget `MaterialApp` di `main.dart` menjadi `const LoginPage()`
- Membuat file `register.dart` di folder `screens/` yang berisi class `RegisterPage`
- Memperbarui fungsi `onTap` pada widget `GestureDetector` di `login.dart` untuk menavigasi ke halaman `RegisterPage`
- Convert data JSON dari endpoint `/json/` menjadi language Dart menggunakan site Quicktype
- Membuat folder `lib/models/`, menambahkan file `news_entry.dart`, dan mengisinya dengan kode model versi Dart
- Menjalankan perintah `flutter pub add http` di terminal
- Menambahkan permission `<uses-permission android:name="android.permission.INTERNET" />` pada file `android/app/src/main/AndroidManifest.xml`

Pada Project Django (`goals-n-glory`):
- Membuat fungsi `proxy_image` di `main/views.py` untuk mengatasi masalah CORS pada gambar dan menambahkan path `'proxy-image/'` di `main/urls.py`
- Membuat fungsi `show_json_my` di `main/views.py` untuk mengambil data JSON hanya milik user yang sedang login dan menambahkan path `'json-my/'` di `main/urls.py`
- Membuat fungsi `add_product_flutter` di `main/views.py` untuk menerima data POST dan menambahkan path `'add-product-flutter/'` di `main/urls.py`

Pada Project Flutter (`goals_n_glory_mobile`):
- Membuat file `product_entry_card.dart` di `lib/widgets/` untuk tampilan card product
- Membuat file `product_entry_list.dart` di `lib/screens/` yang berisi fungsi `fetchProducts` (menggunakan `CookieRequest` dari `Provider`) dan widget `ProductEntryListPage` (dengan `FutureBuilder` untuk menampilkan list products)
- Membuat file `my_product_entry_list.dart` di `lib/screens/` untuk tampilan dan fungsi yang mirip dengan `product_entry_list.dart` tetapi menerapkan filter my products (mengambil data dari endpoint `json-my/` instead of `json/`)
- Menambahkan `ListTile` baru untuk All Products dan My Products pada `widgets/left_drawer.dart`
- Menambahkan import `product_entry_list.dart` dan `my_product_entry_list.dart` kemudian memperbarui `onTap` untuk navigasi ke halaman All Products dan My Products pada `widgets/left_drawer.dart` dan `widgets/product_card.dart`
- Menghubungkan halaman `product_form.dart` dengan `CookieRequest` di dalam method `build`.
- Mengubah perintah `onPressed` pada button Save di `product_form.dart` untuk menggunakan `request.postJson` untuk mengirim data ke endpoint `add-product-flutter/`.
- Menambahkan `ListTile` baru untuk Logout pada `widgets/left_drawer.dart` dan mengubah `onTap` menjadi `async` dan menggunakan `request.logout` untuk mengirim request ke endpoint `auth/logout/`