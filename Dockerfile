FROM adoptopenjdk/openjdk11:latest 
VOLUME C:\study_workspace\demo\demo
COPY target/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]