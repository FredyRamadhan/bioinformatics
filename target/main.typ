// main.typ
#set page(
  paper: "a4",
  margin: (top: 3cm, bottom: 3cm, left: 4cm, right: 3cm),
  numbering: "1",
)

#set text(
  font: ( "Liberation Serif"),
  size: 12pt,
  lang: "id",
)

#set par(
  justify: true,
  leading: 1.15em,
  first-line-indent: 1.25cm,
)

#set heading(numbering: "1.1")

#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  set align(center)
  set text(size: 14pt, weight: "bold")
  block(below: 1.5em)[
    #if it.numbering != none [
      BAB #counter(heading).display("I") \
    ]
    #upper(it.body)
  ]
}

#show heading.where(level: 2): it => {
  set text(size: 12pt, weight: "bold")
  block(above: 1.5em, below: 0.8em)[
    #counter(heading).display() #h(0.5em) #it.body
  ]
}

// ---------------- HALAMAN SAMPUL ----------------
#page(numbering: none)[
  #align(center)[
    #text(size: 14pt, weight: "bold")[
      EVALUASI MODEL KLASIFIKASI MACHINE LEARNING DENGAN PENANGANAN DATA LEAKAGE PADA DETEKSI DINI KANKER PARU-PARU BERBASIS DATA TABULAR KLINIS
    ]

    #v(2.5cm)
    // Ganti dengan #image("logo-uns.png", width: 5cm) jika file gambar tersedia
    #rect(width: 4.5cm, height: 4.5cm, stroke: 1pt + gray)[
      #align(center + horizon)[*[Logo UNS]*]
    ]
    #v(2.5cm)

    #text(weight: "bold")[DISUSUN OLEH:]
    #v(0.5cm)

    #table(
      columns: (auto, auto),
      stroke: none,
      align: (left, left),
      column-gutter: 2cm,
      row-gutter: 0.6em,
      [*BRYANT CIANATA*], [*L0123*],
      [*FREDY TRI RAMADHAN*], [*L0123057*],
      [*KEVIN MARCELINO POROBATEN*], [*L0123073*],
    )

    #v(1fr)

    #text(size: 14pt, weight: "bold")[
      PROGRAM STUDI INFORMATIKA \
      FAKULTAS TEKNOLOGI INFORMASI DAN SAINS DATA \
      UNIVERSITAS SEBELAS MARET \
      2026
    ]
  ]
]

#counter(page).update(1)

// ---------------- BAB I ----------------
= Pendahuluan

== Latar Belakang Masalah
Kanker paru-paru merupakan penyebab utama kematian akibat kanker di seluruh dunia dengan estimasi 1,8 juta kematian setiap tahun @rabby2025biomarkers @ali2025voting. Sebagian besar pasien baru terdiagnosis pada stadium lanjut karena gejala awal penyakit ini sering tidak terlihat @shweikeh2026dbmca @szollar2026early. Pemeriksaan medis menggunakan _low-dose computed tomography_ (LDCT) atau biopsi jaringan membutuhkan biaya tinggi serta fasilitas rumah sakit yang memadai @bu2026digital @szollar2026early. Oleh karena itu, pemanfaatan data klinis dan gejala pasien menjadi alternatif yang terjangkau untuk skrining risiko awal @ansari2026pipeline.

Pendekatan _machine learning_ telah banyak digunakan untuk mengklasifikasikan risiko kanker paru-paru menggunakan data kuesioner gejala dan rekam medis tabular @ali2025voting @ansari2026pipeline. Namun, penelitian terdahulu menunjukkan hasil yang saling bertentangan terkait algoritma terbaik pada data klinis berukuran kecil @ali2025voting @ansari2026pipeline. Sebagian studi mengklaim bahwa model _ensemble_ yang kompleks lebih unggul @ali2025voting, sedangkan studi lain membuktikan bahwa model sederhana seperti _Logistic Regression_ mampu mencapai akurasi yang lebih tinggi @ansari2026pipeline. Perbedaan hasil ini dipengaruhi oleh penerapan _Synthetic Minority Over-sampling Technique_ (SMOTE) dan _feature selection_ pada seluruh _dataset_ sebelum pembagian data latih dan data uji @ali2025voting @liu2026smr.

Penerapan _oversampling_ dan seleksi fitur sebelum _data splitting_ memicu _data leakage_ yang membuat nilai akurasi terlihat tinggi secara tidak realistis @liu2026smr @ji2024swin. Informasi dari data uji ikut terbawa ke dalam proses pelatihan sehingga model gagal melakukan generalisasi dengan baik pada data baru @liu2026smr. Selain itu, perbandingan performa antara model linier sederhana dan model _tree ensemble_ pada alur kerja yang bebas dari _data leakage_ masih jarang dievaluasi secara sistematis @ali2025voting @ansari2026pipeline. Penelitian ini mengusulkan evaluasi model _machine learning_ dengan menerapkan SMOTE dan _feature selection_ secara ketat di dalam _inner fold cross-validation_ pada _dataset_ klinis kanker paru-paru @liu2026smr @ansari2026pipeline.

== Rumusan Masalah
Berdasarkan latar belakang tersebut, rumusan masalah utama dalam penelitian ini adalah:
+ Bagaimana pengaruh penerapan _in-fold_ SMOTE dan _feature selection_ (_SelectKBest_ ANOVA) terhadap pencegahan _data leakage_ pada klasifikasi risiko kanker paru-paru menggunakan data tabular klinis @ali2025voting @liu2026smr?
+ Bagaimana perbandingan performa algoritma sederhana (_Logistic Regression_ dan _Support Vector Machine_) terhadap model _tree ensemble_ (_Random Forest_ dan _XGBoost_) yang dioptimasi menggunakan _hyperparameter tuning_ pada _pipeline_ bebas _data leakage_ @ali2025voting @ansari2026pipeline?

== Batasan Penelitian
Untuk menjaga fokus dan kelayakan penelitian pada tingkat sarjana, penelitian ini memiliki batasan sebagai berikut:
+ Data yang digunakan adalah dua _dataset_ publik berformat CSV dari Kaggle, yaitu _Survey Lung Cancer_ (309 baris, 16 atribut) dan _Cancer Patient Risk Dataset_ (1.000 baris, 25 atribut) @ali2025voting @ansari2026pipeline.
+ Algoritma _machine learning_ yang dievaluasi dibatasi pada empat model utama: _Logistic Regression_, _Support Vector Machine_ (SVM), _Random Forest_, dan _XGBoost_ @ali2025voting @ansari2026pipeline.
+ Proses _feature selection_ menggunakan metode _filter_ _SelectKBest_ berbasis nilai _ANOVA F-value_, sedangkan penanganan _class imbalance_ menggunakan SMOTE @ali2025voting.
+ Evaluasi performa difokuskan pada metrik _Accuracy_, _Precision_, _Recall_, _F1-Score_, dan _Area Under the Receiver Operating Characteristic Curve_ (ROC-AUC) @ansari2026pipeline.

== Tujuan Penelitian
Tujuan dari pelaksanaan penelitian ini adalah:
+ Mengukur perbedaan performa model _machine learning_ antara skenario konvensional (yang berisiko mengalami _data leakage_) dan skenario _in-fold pipeline_ pada deteksi dini kanker paru-paru @liu2026smr @ali2025voting.
+ Menentukan algoritma klasifikasi dengan performa terbaik di antara _Logistic Regression_, SVM, _Random Forest_, dan _XGBoost_ setelah melalui proses _hyperparameter tuning_ menggunakan _GridSearchCV_ @ansari2026pipeline.

== Manfaat Penelitian
Manfaat yang diharapkan dari penelitian ini meliputi:
+ *Manfaat Akademis*: Memberikan acuan metodologi eksperimen _machine learning_ yang benar dan bebas _data leakage_ bagi peneliti pemula di bidang _medical informatics_ @liu2026smr @ansari2026pipeline.
+ *Manfaat Praktis*: Menyediakan konfigurasi model prediksi risiko kanker paru-paru yang ringan, akurat, dan dapat dijalankan pada perangkat komputasi spesifikasi rendah tanpa memerlukan GPU @ali2025voting @ansari2026pipeline.

// ---------------- BAB II ----------------
= Tinjauan Pustaka

== Deteksi Dini Kanker Paru-Paru Berbasis Data Tabular Klinis
Skrining awal kanker paru-paru menggunakan data gejala klinis dan faktor gaya hidup merupakan pendekatan non-invasif yang efektif untuk mengidentifikasi pasien berisiko tinggi @ansari2026pipeline @li2022gpb. Data tabular klinis umumnya mencatat variabel demografis seperti usia dan jenis kelamin, kebiasaan merokok, serta gejala fisik seperti batuk kronis, sesak napas, dan nyeri dada @ali2025voting. Berbeda dengan pemrosesan citra _CT scan_ atau data _multi-omics_ yang membutuhkan kapasitas penyimpanan besar dan komputasi GPU, analisis data tabular klinis dapat dieksekusi secara instan menggunakan CPU standar @ali2025voting @ansari2026pipeline. Hal ini menjadikan data tabular klinis sangat ideal untuk pengembangan sistem pendukung keputusan klinis pada fasilitas kesehatan tingkat pertama @ansari2026pipeline.

== Studi Terdahulu pada Klasifikasi Kanker Paru-Paru
Sejumlah penelitian terbaru telah mengeksplorasi berbagai algoritma _machine learning_ pada _dataset_ klinis kanker paru-paru @ali2025voting @ansari2026pipeline. Ali et al. (2025) mengombinasikan penyeimbangan kelas SMOTE dengan seleksi fitur _SelectKBest_ ANOVA (mengambil 9 fitur terbaik) dan model _Voting Ensemble_ yang menggabungkan _Random Forest_, SVM, dan _Logistic Regression_ @ali2025voting. Penelitian tersebut melaporkan akurasi sebesar 99,0% pada _Cancer Patient Risk Dataset_ dan 92,5% pada _Survey Lung Cancer Dataset_ @ali2025voting. Namun, hasil eksperimen mereka juga menunjukkan bahwa model tunggal _Logistic Regression_ sebenarnya mampu mencapai akurasi 94,0% pada _Survey Lung Cancer Dataset_, mengungguli model _Voting Ensemble_ yang diusulkan @ali2025voting.

Penelitian lain oleh Ansari et al. (2026) mengintegrasikan metode seleksi fitur dengan optimasi _hyperparameter_ menggunakan _GridSearchCV_ pada _Survey Lung Cancer Dataset_ @ansari2026pipeline. Mereka mengevaluasi algoritma _Logistic Regression_, _Support Vector Classifier_ (SVC), _Random Forest_, _Gradient Boosting_, _K-Nearest Neighbors_ (KNN), dan _Gaussian Naive Bayes_ (GNB) @ansari2026pipeline. Hasil penelitian tersebut membuktikan bahwa model _Logistic Regression_ yang dioptimasi menghasilkan akurasi tertinggi sebesar 91,07% dan nilai ROC-AUC sebesar 0,91 @ansari2026pipeline. Performa model linier tersebut melampaui model _ensemble_ yang lebih kompleks seperti _Random Forest_ (87,5%) dan _Gradient Boosting_ (87,5%) pada ukuran sampel yang terbatas @ansari2026pipeline.

== Permasalahan Data Leakage dan Class Imbalance
_Dataset_ medis sering memiliki distribusi kelas yang tidak seimbang (_class imbalance_), contohnya pada _Survey Lung Cancer Dataset_ yang memiliki 270 sampel positif berbanding 39 sampel negatif @ali2025voting @ansari2026pipeline. Untuk mengatasi masalah ini, teknik _oversampling_ seperti SMOTE sering digunakan guna menghasilkan sampel sintetis pada kelas minoritas @ali2025voting. Namun, kesalahan metodologis yang sering terjadi pada studi terdahulu adalah menerapkan SMOTE dan _feature selection_ pada keseluruhan data sebelum dibagi menjadi _training set_ dan _testing set_ @ali2025voting @liu2026smr. Prosedur yang benar mengharuskan proses normalisasi, seleksi fitur, dan pembuatan sampel sintetis SMOTE dilakukan secara eksklusif di dalam _training fold_ pada saat _cross-validation_ untuk mencegah _data leakage_ @liu2026smr @bounassif2025severity @liu2022kl.

// ---------------- BAB III ----------------
= Metodologi Penelitian

== Sumber Data dan Lingkungan Komputasi
Penelitian ini menggunakan dua _dataset_ sekunder bersifat _open-access_ yang diunduh dari repositori Kaggle @ali2025voting @ansari2026pipeline:
+ *Survey Lung Cancer Dataset*: Terdiri dari 309 baris data pasien dengan 15 atribut fitur (gejala klinis dan kebiasaan) serta 1 atribut target biner (`YES` = 270, `NO` = 39) @ali2025voting @ansari2026pipeline.
+ *Cancer Patient Risk Dataset*: Terdiri dari 1.000 baris data pasien dengan 24 atribut fitur numerik/ordinal serta 1 atribut target tingkat risiko (`Low`, `Medium`, `High`) @ali2025voting.

Seluruh eksperimen diimplementasikan menggunakan bahasa pemrograman Python pada komputer standar tanpa akselerasi GPU @ali2025voting @ansari2026pipeline. Pustaka (_libraries_) utama yang digunakan meliputi `pandas` dan `numpy` untuk manipulasi data, `scikit-learn` untuk pemodelan dan evaluasi, serta `imbalanced-learn` untuk implementasi SMOTE di dalam _pipeline_ @ali2025voting @ansari2026pipeline.

== Tahapan Eksperimen
Alur pelaksanaan penelitian dibagi menjadi lima tahap sistematis yang mudah direproduksi oleh peneliti pemula @ali2025voting @ansari2026pipeline:
+ *Data Preprocessing*: Melakukan pemeriksaan _missing values_, menghapus duplikasi data, dan melakukan _encoding_ pada variabel kategorikal (seperti mengubah label jenis kelamin dan target menjadi format numerik) @bounassif2025severity @ansari2026pipeline.
+ *Pembagian Data (_Data Splitting_)*: Membagi _dataset_ menggunakan skema _Stratified 10-Fold Cross-Validation_ untuk memastikan proporsi kelas positif dan negatif tetap seimbang pada setiap _fold_ @ali2025voting @liu2026smr.
+ *Konstruksi Pipeline (Skenario Bebas Data Leakage)*: Membangun objek `Pipeline` dari pustaka `imbalanced-learn` yang membungkus empat tahapan berurutan di dalam setiap _training fold_:
  - _StandardScaler_ untuk menstandardisasi skala fitur numerik @ansari2026pipeline.
  - _SMOTE_ untuk menyeimbangkan proporsi kelas minoritas hanya pada data latih @ali2025voting @liu2026smr.
  - _SelectKBest_ dengan fungsi skor `f_classif` (_ANOVA F-test_) untuk memilih subset fitur paling informatif @ali2025voting @bounassif2025severity.
  - Pelatihan model klasifikasi (_Logistic Regression_, SVM, _Random Forest_, dan _XGBoost_) @ali2025voting @ansari2026pipeline.
+ *Hyperparameter Tuning*: Menggunakan _GridSearchCV_ di dalam _cross-validation_ untuk mencari kombinasi parameter optimal, seperti parameter regularisasi `C` pada _Logistic Regression_ dan SVM, serta `n_estimators` dan `max_depth` pada _Random Forest_ dan _XGBoost_ @ansari2026pipeline.
+ *Eksperimen Pembanding*: Menjalankan skenario pembanding di mana SMOTE dan _SelectKBest_ diterapkan sebelum proses _cross-validation_ guna mendemonstrasikan dampak _data leakage_ terhadap metrik evaluasi @ali2025voting @liu2026smr.

== Evaluasi Kinerja Model
Kinerja dari masing-masing model dievaluasi pada _validation fold_ yang tidak tersentuh oleh proses SMOTE menggunakan lima metrik standar @ansari2026pipeline:
+ *Accuracy*: Rasio total prediksi yang benar terhadap keseluruhan sampel uji @ali2025voting @ansari2026pipeline.
+ *Precision*: Rasio prediksi positif yang benar terhadap seluruh hasil yang diprediksi positif oleh model @ali2025voting @ansari2026pipeline.
+ *Recall (Sensitivity)*: Kemampuan model dalam mendeteksi seluruh kasus kanker paru-paru yang sebenarnya @ali2025voting @ansari2026pipeline.
+ *F1-Score*: Nilai rata-rata harmonik dari _Precision_ dan _Recall_ untuk mengukur keseimbangan performa pada data yang _imbalanced_ @ansari2026pipeline.
+ *ROC-AUC*: Kemampuan diskriminasi model dalam membedakan kelas positif dan negatif pada berbagai ambang batas (_threshold_) probabilitas @ansari2026pipeline.

// ---------------- DAFTAR PUSTAKA ----------------
#pagebreak()
#set heading(numbering: none)
#bibliography("refs.bib", title: [DAFTAR PUSTAKA], style: "apa")