import matplotlib.pyplot as plt
import matplotlib.patches as patches
import os

def generate_diagram():
    fig, ax = plt.subplots(figsize=(10, 8), dpi=300)
    ax.set_xlim(0, 100)
    ax.set_ylim(0, 100)
    ax.axis('off')

    # Styles
    box_blue = dict(boxstyle="round,pad=0.5", fc="#E3F2FD", ec="#1E88E5", lw=1.5)
    box_green = dict(boxstyle="round,pad=0.5", fc="#E8F5E9", ec="#43A047", lw=1.5)
    box_orange = dict(boxstyle="round,pad=0.5", fc="#FFF3E0", ec="#FB8C00", lw=1.5)
    box_purple = dict(boxstyle="round,pad=0.5", fc="#F3E5F5", ec="#8E24AA", lw=1.5)
    box_red = dict(boxstyle="round,pad=0.5", fc="#FFEBEE", ec="#E53935", lw=1.5)
    box_gray = dict(boxstyle="round,pad=0.4", fc="#F5F5F5", ec="#9E9E9E", lw=1.0)

    arrow_props = dict(facecolor='#424242', edgecolor='#424242', width=1.2, headwidth=6, headlength=7, shrink=0.08)

    # Title
    ax.text(50, 96, "Alur Metodologi Penelitian Klasifikasi Kanker Paru", 
            ha='center', va='center', fontsize=13, fontweight='bold', color='#1A237E')

    # Stage 1: Dataset Acquisition
    t1 = ax.text(50, 86, 
                 "1. Pengumpulan Dataset Ekspresi Gen Terbuka (Open Access)\n"
                 "• Data Latih: TCGA-LUAD (RNA-seq, n = 594: 535 tumor, 59 normal)\n"
                 "• Data Uji Eksternal 1: GSE19804 (GPL570 Microarray, n = 120: 60 tumor, 60 normal)\n"
                 "• Data Uji Eksternal 2: GSE10072 (GPL96 Microarray, n = 107: 58 tumor, 49 normal)",
                 ha='center', va='center', fontsize=9.5, bbox=box_blue, multialignment='left')

    # Stage 2: Partitioning & Leakage Prevention
    t2 = ax.text(50, 69, 
                 "2. Partisi Data dan Pencegahan Kebocoran Informasi (Split-Before-Standardization)\n"
                 "• Isolasi data uji eksternal secara penuh sebelum estimasi parameter\n"
                 "• Penerapan Stratified 5-Fold Cross-Validation khusus pada TCGA-LUAD data latih\n"
                 "• Parameter penskalaan hanya dihitung pada fold latih internal",
                 ha='center', va='center', fontsize=9.5, bbox=box_green, multialignment='left')

    # Stage 3: Feature Standardization & Selection
    t3 = ax.text(50, 52, 
                 "3. Seleksi Fitur dan Standarisasi Lintas Platform\n"
                 "• Ekstraksi Panel Konsensus 10 Gen (ADRB2, AGER, CAT, CLEC3B, FAM189A2,\n"
                 "  EDNRB, MME, BUB1B, CENPF, PLK1) & Pembanding In-Fold (LASSO / Boruta)\n"
                 "• Uji Standarisasi Lintas Platform: Nilai Log2, Z-Score Kohort, Transformasi Peringkat",
                 ha='center', va='center', fontsize=9.5, bbox=box_orange, multialignment='left')

    # Stage 4: ML Model Training
    t4 = ax.text(50, 35, 
                 "4. Pelatihan Model Pembelajaran Mesin (Model Ringan & Teruji)\n"
                 "• Logistic Regression (Reguler L1 / L2)\n"
                 "• Support Vector Machine (Linear SVM & RBF SVM)\n"
                 "• Random Forest (Ensemble Pohon Keputusan)\n"
                 "• Penyetelan hiperparameter via Stratified Grid Search pada fold latih",
                 ha='center', va='center', fontsize=9.5, bbox=box_purple, multialignment='left')

    # Stage 5: Evaluation
    t5 = ax.text(50, 18, 
                 "5. Evaluasi Kinerja dan Analisis Generalisasi Lintas Platform\n"
                 "• Evaluasi Internal: 5-Fold Stratified CV pada TCGA-LUAD\n"
                 "• Evaluasi Eksternal: Pengujian Buta pada GSE19804 & GSE10072\n"
                 "• Metrik: ROC-AUC, PR-AUC, Akurasi, Sensitivitas, Spesifisitas, F1-Score",
                 ha='center', va='center', fontsize=9.5, bbox=box_red, multialignment='left')

    # Decision / Outcome Note
    t6 = ax.text(50, 5, 
                 "Keluaran: Model terverifikasi tanpa kebocoran data dengan generalisasi lintas platform yang andal",
                 ha='center', va='center', fontsize=9, style='italic', color='#37474F', bbox=box_gray)

    # Arrows
    ax.annotate('', xy=(50, 75.5), xytext=(50, 79.5), arrowprops=arrow_props)
    ax.annotate('', xy=(50, 58.5), xytext=(50, 62.5), arrowprops=arrow_props)
    ax.annotate('', xy=(50, 41.5), xytext=(50, 45.5), arrowprops=arrow_props)
    ax.annotate('', xy=(50, 24.5), xytext=(50, 28.5), arrowprops=arrow_props)
    ax.annotate('', xy=(50, 8.5), xytext=(50, 11.5), arrowprops=arrow_props)

    plt.tight_layout()
    os.makedirs("diagrams", exist_ok=True)
    os.makedirs("images", exist_ok=True)
    
    diagram_path = os.path.join("diagrams", "alur_penelitian.png")
    image_path = os.path.join("images", "alur_penelitian.png")
    
    plt.savefig(diagram_path, dpi=300, bbox_inches='tight')
    plt.savefig(image_path, dpi=300, bbox_inches='tight')
    plt.close()
    print(f"Diagram saved to {diagram_path} and {image_path}")

if __name__ == "__main__":
    generate_diagram()
