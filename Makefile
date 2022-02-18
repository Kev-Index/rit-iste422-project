all : clean build testing run_app


build : lib/junit-4.12.jar lib/hamcrest-core-1.3.jar
	echo "Compiling source code and unit tests..."
	javac -cp lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar src/main/java/*.java src/test/java/*.java -d ./build

testing : lib/junit-4.12.jar lib/hamcrest-core-1.3.jar ./build build
	echo "Running unit tests..."
	java -cp .:lib/junit-4.12.jar:lib/hamcrest-core-1.3.jar:./build org.junit.runner.JUnitCore EdgeConnectorTest

run_app: build
	echo "Running application..."
	java -cp ./build RunEdgeConvert

clean :
	echo "Removing class folder..."
	rm -r ./build/