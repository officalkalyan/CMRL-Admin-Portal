# Stage 1: Serve the Angular app with Tomcat
FROM tomcat:9.0.90

# Copy the built artifacts from the builder stage to the Tomcat webapps directory
COPY /dist/ /opt/apache-tomcat-9.0.90/webapps

# Expose port 8080 to allow outside access to the Angular application
EXPOSE 8080

# Start Tomcat server to serve the Angular app
CMD ["catalina.sh", "run"]
