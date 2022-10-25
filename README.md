# OccupInvent
An analysis of the relative importance of talus characteristics on climate on pika occupancy.

## Data Used

- A subset of northwestern Nevada talus sites with current or historic pika occupancy

- Climate

	+ PRISM 30-Year Normals(https://prism.oregonstate.edu/normals/): annual precipitation, temperature
	+ Derived: Actual EvapoTranspiration, HeatLoad

- Talus Map(https://gblel-dlm.opendata.arcgis.com/maps/DLM::northwest-nevada-talus-map/explore): talus shape, talus size

### Analysis

 - [randomForest](https://cran.r-project.org/web/packages/randomForest/index.html)


#### Resources

- ![what is a pika?](/References/MassMntnPika.pdf)

- (Some press)[https://www.esri.com/about/newsroom/arcuser/mapping-pikas-habitat-to-help-save-them/]

- [Northwest Nevada Pika Distribution](/References/Jeffress_NWNVPika_2017.pdf)

- [Pika Connectivity](/References/Castillo-etal_2016_-PikaConnectivity-NatPks.pdf)

##### Tasks
- [] climate variable correlation matrix
- [] talus map: 4x moving window
- [] talus map: lower talus classification threshold
- [] boosted regression tree analysis
- [] use monitoring data with mepopulation variable

