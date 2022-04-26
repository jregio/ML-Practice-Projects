# ML-Practice-Projects
Just some projects to help me practice machine learning

---

**Principal Component Analysis of Codon Usage (4/26/22)**

The codon usage dataset was obtained from the UCI Machine Learning Repository ([Khomtchouk](https://archive.ics.uci.edu/ml/datasets/Codon+usage)).  Each entry contained the kingdom, DNA type, ID, number of codons, name, and the frequencies of 64 codons for each species.  Only the kindom and codon frequencies were used in this project.

Principal component analysis (PCA) was used to reduce the 64-dimensional dataset into 3 dimensions.  Although only 54% of the variance was retained, the resulting 3D plot provided an interesting pattern on the genomic distribution of species.

![Codon clusters](/images/codon_clusters.jpg)

3 clusters were manually picked out from the plot.  Friend and collaborator P.C. pointed out that each cluster corresponded to relative emergences. The early emergence of bacteria & plants was followed by that of the invertebrates and then by mammals & vertebrates, corresponding to the "Old", "Mid", and "New" clusters, respectively.  It worth noting that although plasmids are not a kingdom, the samples extracted from the plasmids of bacteria are present in the "New" cluster, perhaps providing a hint at the origins of plasmids.  


---

**Predicting Glycosylation using Neural Network (4/13/22)**

The same glycosylation dataset was used, this time the goal was classification rather than regression.  The entries were labelled with stereochemical outcomes α-dominant, β-dominant, or competition, depending on the value of α-selectivity (a).

A neural network with 2 hidden layers was used to predict the stereochemical outcome.  The height of the hidden layers was tuned in addition to the regularization hyperparameter (lambda).

The model that yielded the lowest cost on the validation set had a height of 14 for its hidden layers and the value of lambda was 3.0.  When evaluated on the test set, the accuracy of the model was 0.73.  Despite the poor performance of the model, this project was a good first step for gaining experience in neural networks.

_Target variable:_ Stereochemical outcome
- α-dominant (a >= 60)
- β-dominant (a < 40)
- competition (40 <= a < 60)

---

**Predicting Glycosylation using Linear Regression (4/9/22)**

The glycosylation dataset was obtained from one of my PI's papers ([Gilmore](https://doi.org/10.1039/D0SC06222G)).  Experimental parameters were used to predict the stereochemical outcome of the glycosylation reaction.  Features included temperature along with computational descriptors for the electrophile, nucleophile, activator, and solvent (11 total features).  The computational descriptors were obtained using DFT.

In the original paper, random forests were used to predict the stereochemical outcome.  In this project, I attempted to use linear regression to predict the selectivity of the alpha product.

The linear regression model had a cost of 105.023220 on the training dataset.  On an evaluation dataset, the model had a cost of 114.187881.  The high cost on both training and evaluation sets is a sign of high bias, suggesting that either there were not enough features or the existing features were not suitable for predicting the outcome.

_Features:_
- Temperature
- Electrophile
  - C4
  - C2
  - C shift
- Nucleophile
  - O shift
  - O area
  - alpha carbon area
- Activator
  - HOMO
  - Area
- Solvent
  - Minimum potential energy
  - Maximum potential energy

_Target variable:_ alpha selectivity

---


**Iris Classification (3/24/22)**

The Iris dataset was obtained from the UCI Machine Learning repository ([Fisher and Marshall](https://archive.ics.uci.edu/ml/datasets/Iris)).  Features of the plant were used to classify the species.  

Logistic regression was implemented along with regularization.  Validation set was used to tune regularization hyperparameter.  

Model achieves around 92% - 100% test accuracy.  Large variation in test accuracy is due to the small size of the dataset (m = 150).

_Features:_
- Sepal length (cm)
- Sepal width (cm)
- Petal length (cm)
- Petal width (cm)

_Classes:_
- Iris setosa
- Iris versicolour
- Iris virginica
