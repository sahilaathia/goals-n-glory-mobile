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
Hot Reload (Ctrl+):
- Memuat perubahan kode ke VM dan rebuild widget tree
- Mempertahankan state aplikasi (data tidak hilang)
- Tidak menjalankan ulang main() atau initState()
- Sangat cepat (dalam hitungan detik)
- Cocok untuk perubahan UI/tampilan

Hot Restart (Shift+Ctrl+):
- Memuat perubahan kode dan restart aplikasi Flutter
- State aplikasi hilang (reset ke kondisi awal)
- Menjalankan ulang main() dan initState()
- Lebih lambat dari hot reload
- Diperlukan untuk perubahan struktur/logika yang signifikan

Flutter web mendukung hot restart tapi tidak hot reload.