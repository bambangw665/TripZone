import 'package:tripzone/models/activity_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class Destination {
  String imageUrl;
  String namaDestinasi;
  String kota;
  String description;
  String largeText;
  String priceIDR;
  String latitude;
  String longitude;
  String rating;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.namaDestinasi,
    this.kota,
    this.description,
    this.activities,
    this.largeText,
    this.priceIDR,
    this.latitude,
    this.longitude,
    this.rating,
  });

}


List<Activity> activities = [
];

List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/images/Curug_Telu.jpg',
    namaDestinasi: 'Curug Telu',
    kota: 'Banyumas',
    description: 'Curug yang berada di Desa Karangsalam, Kecamatan Baturraden',
    largeText: 'Curug yang berada di Desa Karangsalam, Kecamatan Baturraden, Banyumas dan lebih tepatnya Berlokasi di bawah kaki Gunung Slamet, ini berbeda dari curug kebanyakan, lho.. Di Curug Telu, kamu akan menemukan tiga curug sekaligus dalam satu tempat. Ini sesuai dengan kata telu yang dalam bahasa Jawa berarti tiga. ',
    priceIDR: 'Rp 10.000',
    latitude: '-7.319880',
    longitude: '109.241970',
    rating: '4.2',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/CampBengkok.jpg',
    namaDestinasi: 'Camp Area Umbul Bengkok',
    kota: 'Banyumas',
    description: 'Camp area umbul bengkok yang berlokasi di desa Dusun II',
    largeText: 'Camp area umbul bengkok yang berlokasi di desa Dusun II, karang salam,Baturaden  ini merupakan destinasi wisata baru khusus buat kamu yang ingin merasakan camping dengan suasana alam yang mengagumkan dan tanpa harus jauh jauh untuk mendaki gunung untuk mendapatkan suasana atau spot menarik di pagi maupun malam hari. ',
    priceIDR: 'Rp 2.0000',
    latitude: '-7.316180',
    longitude: '109.241697',
    rating: '4.3',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/cipendok.jpg',
    namaDestinasi: 'Air Terjun Cipedok',
    kota: 'Banyumas',
    description: 'Curug Cipendok adalah curug yang memiliki ketinggian sekitar 93 m',
    largeText: 'Curug Cipendok adalah curug yang memiliki ketinggian sekitar 93 m yang masuk kedalam wilayah Perhutani Kesatuan Pemangkuan Hutan, Banyumas Timur. Lingkungan di curug ini masih alami dengan hutan produksi dan lindung yang terjaga baik, sehingga bisa menjadi daya tarik tersendiri. Pemandangan alam yang indah dan kesejukannya memang sangat terasa saat memasuki area wisata Curug Cipendok. ',
    priceIDR: 'Rp 9.0000',
    latitude: '-7.336739',
    longitude: '109.136508',
    rating: '4.4',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/telaga_sunyi.jpg',
    namaDestinasi: 'Telaga Sunyi',
    kota: 'Banyumas',
    description: 'Telaga Sunyi Wisata sungai dan air terjun ini berada di Limpakuwus',
    largeText: 'Telaga Sunyi Wisata sungai dan air terjun ini berada di Limpakuwus, Sumbang, Kabupaten Banyumas, yang memiliki udara sejuk karena dikelilingi pepohonan rindang yang menghijau. Berlokasi di tengah area hutan, tempat wisata ini menawarkan keindahan pemandangan yang begitu memesona.  ',
    priceIDR: 'Rp 13.0000',
    latitude: '-7.305693',
    longitude: '109.242428',
    rating: '4.5',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/images/hutanPinus.jpg',
    namaDestinasi: 'H Pinus Limpakuwus',
    kota: 'Banyumas',
    description: 'Hutan pinus ini patut untuk Anda kunjungi saat hari libur.',
    largeText: 'Hutan pinus ini patut untuk Anda kunjungi saat hari libur. Banyak keistimewaan yang bisa Anda dapatkan di tempat wisata ini, pastinya bisa membuat Anda merasa nyaman dan betah berlama-lama liburan di sini. Panorama alam hutan pinus yang rindang sangat memanjakan mata, terasa teduh dan asri, sehingga bikin nyaman berada di sini.',
    priceIDR: 'Rp 10.0000',
    latitude: '-7.307477',
    longitude: '109.243820',
    rating: '4.6',
    activities: activities,
  ),];

