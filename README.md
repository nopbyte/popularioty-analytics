# popularioty-analytics
Umbrella project for the analytics projects for popularioty

Each subproject must be installed with maven, or built with mvn eclipse:eclipse. Start with the commons...

#Requirements

* Hadoop :)

#Run

To built the hadoop job execute:
	
	cd popularioty-runtime-analytics/
	mvn clean package
	cd ..

And to run it:

	hadoop jar ./popularioty-runtime-analytics/target/popularioty-runtime-analytics-1.0-SNAPSHOT-job.jar input/ output2/

Where input needs to have a file with some words 




