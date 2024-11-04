MODULE="Modules/WeatherNetwork/Sources/WeatherNetwork/"
openapi-generator generate -i "weatherAPI.yaml" -g swift5 -o "weatherAPI"
rm -r $MODULE""*
cp -R "weatherAPI/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "weatherAPI"
