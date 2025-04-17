# HMPF-UKF
## Code
The "code" folder contains the following contents:
-CirclarGraph: MATLAB toolbox used to plot Figure 04.
-barsd.m: MATLAB code used to plot Figure 09.
-circlegraph.m: MATLAB code used to plot Figure 04.
-analysis_correlation.html: HTML format of the Jupyter Notebook for correlation analysis.
-bayise.html: HTML format of the Jupyter Notebook for Bayesian analysis.

For the HMPF-UKF model code, please contact the following email: 632107110224@mails.cqjtu.edu.cn.
## Data
The "data" folder contains three Excel files:
-CorrelationData V1.0.xlsx: The data to be used in analysis_correlation.html (Python), which is also a subset of the data from EarlyWarningData v3.1.xlsx.
-DifferKMResults.xlsx: The results of various metrics of the HMPF-UKF model under different kp and ms parameters.
-EarlyWarningData v3.1.xlsx: The complete data used by the HMPF-UKF model. We have integrated and preprocessed the data collected by various school sensors, and sensitive key information has been anonymized.

CorrelationData V1.0.xlsx includes the following columns:
- s_id: Student index
- card_count: Number of times the student used their campus card during the semester
- lib_book_borrow: Total number of books borrowed by the student during the semester
- lib_count: Number of times the student entered the library during the semester
- dormitory_count: Number of times the student entered or exited the dormitory during the semester
- school_count: Number of times the student entered or exited the campus gate during the semester
- morn: Number of times the student left early in the morning during the semester
- night: Number of times the student returned late to the dormitory during the semester
- AllTermAveGrade: Same as the explanation in EarlyWarningData dataset
- EntranceGrade: College entrance exam score (Gaokao score)
- NolEntranceGrade: Standardized Gaokao score after regionalization
- higher_lib: The "HigherAveLine" column from the HigherLibraryAveTime sheet in the EarlyWarningData dataset
- higher_dorm: The "HigherAveLine" column from the HigherDormitoryAveTime sheet in the EarlyWarningData dataset
- higher_school: The "HigherAveLine" column from the HigherSchoolGateAveTime sheet in the EarlyWarningData dataset
- FailedCsTerm01: Same as the explanation in EarlyWarningData dataset
- FailedCsTerm06: Same as the explanation in EarlyWarningData dataset

DifferKMResults.xlsx includes the following column naming convention:
-kpXmsY:
--X represents the value of kp within the range [0.1, 0.9], specifically in steps of 0.X.
--Y represents the value of ms within the range [75, 85].

EarlyWarningData v3.1.xlsx:
-Detailed data explanations can be found in the DataDescripe sheet.

