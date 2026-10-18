#import "@preview/jilid:0.2.0": (
  frontmatter, jilid, signature, signatures,
)

#show: jilid.with(
  title: [Klasifikasi Kanker Paru Berbasis Profil Ekspresi Gen Menggunakan Model Pembelajaran Mesin Teruji dan Standarisasi Lintas Platform Tanpa Kebocoran Data],
  kind: [Proposal Penelitian],
  course: "Komputasi Biomedik",
  lecturers: (name: "Dr. Dosen Pengampu, S.Kom., M.Kom.", id: "198501012010121001"),
  students: (
    (name: "Nama Peneliti Mahasiswa", id: "1234567890"),
  ),
  program: "Teknik Informatika",
  faculty: "Fakultas Teknik",
  university: "Universitas",
  year: "2026",
  bibliography: bibliography("refs.bib", style: "ieee"),
)

#frontmatter(title: [Lembar Pengesahan])[
  #v(1cm)
  #signatures(
    header: [Kota, 18 Oktober 2026 \ Mengetahui,],
    signature(
      role: [Dosen Pembimbing],
      name: "Dr. Dosen Pengampu, S.Kom., M.Kom.",
      id: "198501012010121001",
    ),
    signature(
      role: [Mahasiswa Pengusul],
      name: "Nama Peneliti Mahasiswa",
      id-label: "NIM",
      id: "1234567890",
    ),
  )
]

#frontmatter(title: [Abstrak], label: <abstrak>)[
  Kanker paru merupakan penyebab utama mortalitas akibat penyakit kanker di dunia.
  Deteksi dini pada stadium awal sangat menentukan keberhasilan terapi klinis pasien.
  Perkembangan bioinformatika memungkinkan pemanfaatan data transkriptomik untuk deteksi kanker paru menggunakan pembelajaran mesin.
  Namun, banyak penelitian terdahulu mengalami kebocoran data akibat seleksi fitur sebelum pembagian data.
  Selain itu, model komputasi sering mengalami penurunan performa drastis pada platform teknologi berbeda.

  Penelitian ini mengusulkan pipa klasifikasi kanker paru berbasis model pembelajaran mesin teruji.
  Peneliti menerapkan protokol pembagian data sebelum standarisasi untuk mencegah kebocoran informasi.
  Data latih menggunakan kohort RNA-seq TCGA-LUAD.
  Data uji eksternal menggunakan kohort mikroarai independen GSE19804 dan GSE10072.
  Peneliti mengevaluasi regresi logistik, mesin vektor pendukung, dan hutan acak pada panel konsensus 10 gen.
  Peneliti membandingkan tiga metode standarisasi fitur: nilai log2, skor-Z, dan peringkat gen.

  *Kata kunci:* kanker paru, pembelajaran mesin, ekspresi gen, kebocoran data, standarisasi lintas platform
]

= Pendahuluan <bab-pendahuluan>

== Latar Belakang

Kanker paru merupakan penyakit keganasan dengan beban kematian tertinggi di dunia.
Penyakit ini mencatat lebih dari 2,2 juta kasus baru setiap tahun @rabby2025biomarkers.
Kanker paru menyebabkan sekitar 1,8 juta kematian setiap tahun secara global @ali2025voting.
Mayoritas kasus tergolong sebagai kanker paru bukan sel kecil @li2022gpb.
Kanker paru bukan sel kecil didominasi oleh subtipe adenokarsinoma paru dan karsinoma sel skuamosa @almufareh2026methylation.
Pasien stadium awal sering tidak menunjukkan gejala klinis yang nyata @shweikeh2026dbmca.

Keterlambatan diagnosis menyebabkan sebagian besar pasien teridentifikasi pada stadium lanjut.
Tingkat kesintasan lima tahun pasien stadium satu mencapai lebih dari 55 persen @szollar2026early.
Tingkat kesintasan menurun tajam hingga di bawah 10 persen pada stadium lanjut @wang2026adgrd1.
Pemeriksaan tomografi terkomputasi dosis rendah memiliki kelemahan berupa tingkat positif palsu yang tinggi @bu2026digital.
Pemeriksaan tersebut juga memaparkan radiasi dan membutuhkan biopsi invasif untuk konfirmasi @bu2026digital.
Oleh karena itu, dunia medis memerlukan metode deteksi molekuler alternatif yang akurat dan non-invasif.

Perkembangan teknologi sekuensing generasi baru menghasilkan repositori data genomik publik yang masif @li2022gpb.
Basis data TCGA dan GEO menyediakan profil ekspresi gen secara terbuka @rabby2025biomarkers.
Peneliti dapat memanfaatkan data ekspresi gen untuk melatih model pembelajaran mesin @liu2022kl.
Model komputasi mampu mengenali pola perubahan ekspresi gen antara jaringan tumor dan normal @liu2022kl.
Pendekatan ini berpotensi mempercepat penemuan biomarka diagnostik kanker paru secara objektif @li2024luad.

Meskipun hasil yang dilaporkan menjanjikan, banyak studi memiliki kelemahan metodologis mendasar @liu2026smr.
Banyak peneliti melakukan seleksi fitur atau normalisasi sebelum membagi dataset @guo2024mirna.
Praktik keliru ini memicu kebocoran data yang menghasilkan estimasi performa terlalu optimis @ali2025voting.
Selain itu, model yang dilatih pada data RNA-seq sering mengalami penurunan performa pada data mikroarai @lin2024luad.
Banyak studi juga menerapkan model yang terlalu rumit sehingga menyulitkan reproduksi @bounassif2025severity.

Penelitian komputasi biomedis tingkat sarjana memerlukan prioritas pada kebenaran metodologis @ansari2026pipeline.
Peneliti perlu menerapkan isolasi ketat terhadap data uji sebelum pra-pemrosesan @liu2026smr.
Peneliti juga perlu menguji ketahanan model pada data eksternal lintas platform @almufareh2026methylation.
Penelitian ini mengusulkan kerangka klasifikasi kanker paru menggunakan model pembelajaran mesin sederhana.
Kerangka kerja ini mengevaluasi panel marka gen ringkas untuk memastikan kelayakan komputasi bagi peneliti pemula.

== Rumusan Masalah

Peneliti merumuskan tiga pertanyaan penelitian berikut:

+ Bagaimana pengaruh protokol pembagian data sebelum standarisasi terhadap keabsahan evaluasi model klasifikasi kanker paru?
+ Bagaimana efektivitas standarisasi skor-Z dan transformasi peringkat dalam menjaga akurasi klasifikasi lintas platform dari RNA-seq ke mikroarai?
+ Bagaimana perbandingan performa model pembelajaran mesin sederhana pada panel konsensus 10 gen penanda hayati?

== Batasan Penelitian

Peneliti menetapkan batasan penelitian untuk menjaga ruang lingkup eksperimen:

- Penelitian ini menggunakan data ekspresi gen publik berstatus akses terbuka dari TCGA dan GEO.
- Penelitian ini memfokuskan analisis pada klasifikasi biner tumor adenokarsinoma paru dan kontrol normal.
- Penelitian ini menggunakan panel marka gen ringkas yang memuat 10 gen konsensus literatur.
- Penelitian ini menguji tiga algoritma pembelajaran mesin teruji, yaitu regresi logistik, mesin vektor pendukung, dan hutan acak.
- Seluruh eksperimen dijalankan menggunakan prosesor laptop standar tanpa akselerator grafis berbayar.

== Tujuan Penelitian

Penelitian ini memiliki tiga tujuan utama yang menjawab rumusan masalah:

+ Menerapkan protokol pembagian data sebelum standarisasi untuk mencegah kebocoran data pada evaluasi model.
+ Mengevaluasi performa klasifikasi model pada validasi eksternal lintas platform menggunakan skor-Z dan transformasi peringkat.
+ Membandingkan metrik performa regresi logistik, mesin vektor pendukung, dan hutan acak pada sampel adenokarsinoma paru.

== Manfaat Penelitian

Penelitian ini memberikan manfaat dari beberapa perspektif:

- Manfaat Metodologis: Menyediakan prosedur standar pipa pembelajaran mesin biomedis tanpa kebocoran data bagi peneliti pemula.
- Manfaat Ilmiah: Memberikan bukti empiris mengenai ketahanan generalisasi panel marka gen ringkas pada populasi berbeda.
- Manfaat Praktis: Membuktikan bahwa klasifikasi kanker paru berbasis gen dapat diimplementasikan menggunakan perangkat keras standar.

= Tinjauan Pustaka <bab-tinjauan-pustaka>

== Penelitian Terdahulu

Penelitian deteksi kanker paru berbasis pembelajaran mesin berkembang pesat dalam lima tahun terakhir @li2022gpb.
Rabby dkk. menggabungkan delapan kohort transkriptomik untuk memetakan penanda hayati potensial adenokarsinoma paru @rabby2025biomarkers.
Mereka menerapkan seleksi fitur Boruta dan jaringan saraf konvolusi satu dimensi @rabby2025biomarkers.
Studi tersebut menetapkan gen EDNRB dan MME sebagai biomarka inti dengan nilai AUC di atas 0,90 @rabby2025biomarkers.
Namun, mereka menerapkan koreksi kelompok pada seluruh dataset sebelum memisahkan data latih dan uji @rabby2025biomarkers.

Li dkk. mengidentifikasi tiga gen pengatur siklus sel BUB1B, CENPF, dan PLK1 melalui integrasi data mikroarai dan RNA-seq @li2024luad.
Mereka membuktikan signifikansi diagnostik ketiga gen tersebut menggunakan regresi berpenalti LASSO dan hutan acak @li2024luad.
Lin dan Bao menyusun tanda diagnostik enam gen yang mencakup ADRB2, FAM189A2, CLEC3B, AGER, CAT, dan RS1 @lin2024luad.
Model mereka mencapai akurasi sempurna pada data TCGA-LUAD tetapi mengalami penurunan AUC pada validasi mikroarai eksternal @lin2024luad.
Zhang dan Zhou menerapkan analisis jaringan ko-ekspresi gen berbobot untuk menemukan penanda resistensi obat adenokarsinoma paru @zhang2025wgcna.

Liu dan Yao mengusulkan seleksi gen menggunakan divergensi Kullback-Leibler untuk menyaring data ekspresi gen @liu2022kl.
Mereka melatih jaringan saraf dalam tiga lapis dengan fungsi kerugian fokal dan mencapai akurasi 99,93 persen @liu2022kl.
Bou Nassif dkk. mengklasifikasikan stadium keparahan kanker paru menggunakan seleksi ANOVA F-test dan jaringan saraf konvolusi @bounassif2025severity.
Namun, mereka mempertahankan ribuan gen sehingga algoritma pohon keputusan klasik mengalami penurunan performa drastis @bounassif2025severity.
Cai dkk. menggunakan metode penyaringan kemerdekaan pasti berprinsip untuk memprediksi kesintasan pasien pada data berdimensi tinggi @cai2024psis.

Almufareh dkk. mengembangkan jaringan saraf dalam lima lapis untuk mengklasifikasikan adenokarsinoma dan karsinoma sel skuamosa menggunakan metilasi DNA @almufareh2026methylation.
Akurasi model mereka turun dari 96,92 persen menjadi 65,54 persen saat diuji secara silang pada kohort independen @almufareh2026methylation.
Guo dkk. memanfaatkan fitur molekuler mikroRNA yang mencakup tingkat penyuntingan pasca-transkripsi untuk klasifikasi kanker paru @guo2024mirna.
Moghaddam dkk. menerapkan meta-learning pada data mikroarai darah untuk mengatasi keterbatasan jumlah sampel @moghaddam2025metalearning.
Yasmin dkk. mengidentifikasi gen penghubung antara kanker paru dan penyakit paru obstruktif kronis menggunakan seleksi fitur statistik @yasmin2026comorbidity.

Pada modalitas citra tomografi terkomputasi, Shweikeh dkk. mengusulkan klasifikasi model cabang ganda pada dataset LIDC-IDRI @shweikeh2026dbmca.
Jian dkk. menggabungkan lapisan konvolusi dan unit berulang berpagar untuk mendeteksi nodul paru @jian2025cnngru.
Abe dan Nyathi memperkenalkan teknik pertukaran piksel acak untuk meningkatkan generalisasi model ResNet pada dataset citra kecil @abe2025rps.
Pada histopatologi jaringan, Uddin dkk. dan Saxena dkk. menerapkan normalisasi pewarnaan untuk mengklasifikasikan citra mikroskopis @uddin2024multimodal, @saxena2025fastai.
Wang dkk. merancang arsitektur BreezeNet yang ringan, sedangkan Ji dkk. menemukan kejenuhan tolok ukur akibat kebocoran potongan citra @wang2026breezenet, @ji2024swin.
Pada data klinis tabular, Ansari dkk. membuktikan bahwa regresi logistik tertala mampu mengungguli model ansambel yang kompleks @ansari2026pipeline, @ali2025voting.

== Keterbatasan dan Celah Penelitian

Kajian sistematis literatur memperlihatkan tiga kelemahan mendasar:

- Kebocoran Data Transduktif: Banyak studi menerapkan normalisasi atau seleksi gen sebelum pembagian dataset @guo2024mirna, @jian2025cnngru, @ali2025voting. Praktik ini menyusupkan informasi data uji ke dalam pelatihan model.
- Pergeseran Domain Lintas Platform: Model terlatih pada RNA-seq sering mengalami penurunan performa pada mikroarai @almufareh2026methylation, @lin2024luad. Perbedaan distribusi nilai ekspresi antar teknologi belum tertangani dengan baik.
- Kompleksitas Berlebihan Tanpa Penalaan: Banyak studi menerapkan jaringan saraf dalam tanpa membandingkannya dengan model linear tertala @ansari2026pipeline, @almufareh2026methylation. Model kompleks dengan ribuan parameter membutuhkan daya komputasi tinggi dan rentan lewat-jenuh.

== Solusi yang Diusulkan

Peneliti mengusulkan kerangka kerja klasifikasi adenokarsinoma paru yang berfokus pada ketepatan metodologi dan kesederhanaan komputasi.
Peneliti menerapkan protokol pembagian data sebelum standarisasi untuk memastikan ketiadaan kebocoran informasi antar lipatan data.
Data uji eksternal diisolasi secara penuh sebelum proses komputasi apa pun dijalankan pada data latih.
Seluruh parameter penskalaan fitur hanya diestimasi menggunakan lipatan latih internal pada skema validasi silang lima lipat.
Peneliti menggunakan panel konsensus 10 gen penanda hayati yang memiliki validitas biologis tinggi dari studi terdahulu @rabby2025biomarkers, @li2024luad, @lin2024luad.

Panel konsensus tersebut memuat 10 gen terbukti, yaitu ADRB2, AGER, CAT, CLEC3B, FAM189A2, EDNRB, MME, BUB1B, CENPF, dan PLK1.
Peneliti menguji ketahanan generalisasi model menggunakan tiga strategi standarisasi fitur: ekspresi log2 mentah, skor-Z dalam kohort, dan transformasi peringkat gen.
Peneliti membandingkan tiga algoritma pembelajaran mesin teruji: regresi logistik teratur L1 dan L2, mesin vektor pendukung, dan hutan acak.
Peneliti menyetel hiperparameter model menggunakan pencarian kisi berstrata di dalam lipatan latih untuk mencegah optimisme semu.
Seluruh alur kerja dirancang agar dapat dieksekusi dalam hitungan menit pada komputer pribadi standar.

= Metodologi Penelitian <bab-metodologi>

== Desain Penelitian

Peneliti merancang penelitian ini sebagai studi eksperimental komparatif kuantitatif berbasis komputasi.
Peneliti menggunakan desain faktorial untuk mengevaluasi interaksi antara metode standarisasi fitur dan jenis algoritma pembelajaran mesin.
Peneliti menggunakan dataset TCGA-LUAD sebagai kohort primer untuk pelatihan dan validasi silang internal.
Peneliti menggunakan dua dataset independen GSE19804 dan GSE10072 sebagai kohort pengujian eksternal buta.
Desain ini menguji kemampuan generalisasi model pada populasi pasien dan platform pengukuran yang belum pernah ditemui sebelumnya.

== Dataset Penelitian

Peneliti menggunakan tiga dataset transkriptomik publik berstatus akses terbuka penuh:

- Dataset Latih TCGA-LUAD (D01): Diperoleh dari TCGA melalui portal UCSC Xena. Dataset ini memuat 594 sampel RNA-seq yang terdiri dari 535 tumor dan 59 normal.
- Dataset Uji Eksternal 1 GSE19804 (D03): Diperoleh dari GEO pada platform Affymetrix GPL570. Dataset ini memuat 120 sampel wanita Taiwan yang terdiri dari 60 tumor dan 60 normal.
- Dataset Uji Eksternal 2 GSE10072 (D04): Diperoleh dari GEO pada platform Affymetrix GPL96. Dataset ini memuat 107 sampel yang terdiri dari 58 tumor dan 49 normal.

Ketiga dataset menyediakan informasi ekspresi gen yang telah dinormalisasi log2.
Peneliti menyelaraskan identitas probe mikroarai dan transkrip RNA-seq menggunakan simbol gen resmi dari Human Genome Organisation.
Peneliti memverifikasi ketiadaan nilai hilang pada seluruh gen target sebelum analisis dilakukan.

== Metode yang Diusulkan

Peneliti melaksanakan prosedur komputasi melalui enam tahapan utama yang terstruktur:

+ Pra-pemrosesan Data: Peneliti mengunduh matriks ekspresi gen dalam format tab. Peneliti mengekstrak nilai ekspresi dari 10 gen marka target.
+ Partisi Data Tanpa Kebocoran: Peneliti mengisolasi dataset GSE19804 dan GSE10072 sebagai data uji eksternal. Peneliti membagi TCGA-LUAD menjadi lima lipat berstrata untuk validasi silang.
+ Estimasi Standarisasi In-Fold: Peneliti menghitung nilai rata-rata dan simpangan baku hanya pada lipatan latih. Peneliti menerapkan parameter penskalaan tersebut pada lipatan validasi.
+ Standarisasi Fitur Lintas Platform: Peneliti menguji tiga teknik standarisasi pada data uji eksternal. Peneliti menguji ekspresi log2 mentah, skor-Z kohort, dan peringkat persentil gen.
+ Pelatihan dan Penalaan Model: Peneliti melatih model regresi logistik, mesin vektor pendukung, dan hutan acak. Peneliti menyetel parameter penalti C dan jumlah estimator menggunakan pencarian kisi.
+ Evaluasi Metrik Komprehensif: Peneliti mengukur kinerja model menggunakan nilai ROC-AUC, PR-AUC, akurasi, sensitivitas, spesifisitas, dan skor F1.

== Diagram Alur Penelitian

Peneliti menyajikan diagram alur pelaksanaan penelitian secara lengkap pada @gambar-alur.
Diagram tersebut memperlihatkan pemisahan tegas antara data latih primer dan data uji eksternal.
Diagram juga menunjukkan urutan pemrosesan in-fold yang mencegah kebocoran informasi antar tahap komputasi.

#figure(
  image("images/alur_penelitian.png", width: 92%),
  caption: [Diagram alur metodologi penelitian klasifikasi kanker paru tanpa kebocoran data.],
) <gambar-alur>
