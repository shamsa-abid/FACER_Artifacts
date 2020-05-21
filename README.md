# FACER Replication Instructions
The following FACER replication setup instructions are for Windows OS.
## Installation Pre-requisites:
1. Java (https://www.java.com/en/download/)
2. xampp (https://www.apachefriends.org/download.html)
3. R (https://cran.r-project.org/bin/windows/base/old/3.5.1/)
Configure path variables in your System's Environment Variables for <your root>\xampp\mysql\bin and <your root>\R-3.5.1\bin and <your root>\Java\jdk1.8.0_73\bin

## Creating FACER database
1. Download the FACER_Artifacts repository into your local hard drive
2. Navigate to FACER_Artifacts\FACER_Replication_Pack
3. Execute the following command to log in to mysql
```
<your root>\FACER_Replication_Pack>mysql -u root -p
Enter password:
```
When asked for password, simply press enter key. You will be logged into MariaDB terminal where you will create a database for FACER.
4. Execute the following command to create a mysql database for FACER
```
MariaDB [(none)]> create database <DB name>;
Query OK, 1 row affected (0.02 sec)
```
5. Enter \q to exit MariaDB environment

```
MariaDB [(none)]> \q
Bye
```
6. Execute the following command to create FACER database schema using provided script
<your root>\FACER_Replication_Pack>mysql -u root -p <DB name> < FACER_schema.sql
Enter password:

## Downloading FACER dataset
To download the FACER dataset:
```
<your root>\FACER_Replication_Pack>java -jar 1_FACERDataSetDownloader.jar Dataset
```
Once downloaded, extract each archive to a separate folder inside the Dataset folder. This option is available in WinRAR.

## Running FACER Program Analyzer
To run program analyzer you need to supply three arguments; the dataset folder path, the name of the database you created and the path to rt.jar inside your Java installation
```
<your root>\FACER_Replication_Pack>java -jar 2_FACERProgramAnalyzer.jar Dataset <DB name> "<your drive>:\\Program Files\\Java\\jre1.8.0_144\\lib\\rt.jar"
```
Two new csv files will be created in an output folder 

## Running FACER Clustering and MCS detection 
To perform clustering of methods into clone groups(pre-configured for similarity threshold alpha=0.5):
```
<your root>\FACER_Replication_Pack>Rscript 3_FACER_Clustering.R "output"
```
A file will be created in output folder with methods labelled with cluster IDs

To perform mining of Method Clone Structures:
```
<your root>\FACER_Replication_Pack>java -jar 3_FACER_MCS_Mining.jar <DB name>
```

## Replicating Evaluation Results
To replicate evaluation results for FACER with a similarity threshold alpha=0.5, there are two options. 
### Option 1:
To view the metrics calculated for all values of minSup for a particular value of top N recommendations, three arguments are required, namely the name of the database, "false" and a value for top N indicating the number of recomemndations being evaluated. 
```
<your root>\FACER_Replication_Pack>java -jar 4_FACER_Evaluation.jar <db name> false <topN>
```
To view evaluation metrics for top 5 recommendations:
```
<your root>\FACER_Replication_Pack>java -jar 4_FACER_Evaluation.jar <db name> false 5
```
### Option 2:
To view the method bodies of recommendations made against an input method ID with specific values of minSup and topN:
```
<your root>\FACER_Replication_Pack>java -jar 4_FACER_Evaluation.jar <db name> true <topN> <minSup> <MID>
```
To view the method bodies of recommendations made against an input method ID 33 with minSup=3 and topN=5:
```
<your root>\FACER_Replication_Pack>java -jar 4_FACER_Evaluation.jar <db name> true 5 3 33
```
