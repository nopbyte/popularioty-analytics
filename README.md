# popularioty-analytics
Umbrella project for the analytics projects for popularioty


#Requirements

* Hadoop :)

#Quick Start

To get the code:
	
	git clone https://github.com/nopbyte/popularioty-analytics
        cd popularioty-analytics
	git submodule update --init --recursive

Each subproject must be installed with maven, or built with mvn eclipse:eclipse. Start with the commons...

To built the hadoop job execute:
	
	cd popularioty-runtime-analytics/
	mvn clean package
	cd ..

And to run it:

	hadoop jar ./popularioty-runtime-analytics/target/popularioty-runtime-analytics-1.0-SNAPSHOT-job.jar input/ output2/

Where input needs to have a file with some words 




