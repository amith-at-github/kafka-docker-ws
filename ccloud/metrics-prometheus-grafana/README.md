# Prometheus Grafana Integration with Confluent CCloud metrics (/export) endpoint 
* A Sample POC to quickly test  prometheus integration with  */export* (cCloud Metrics endpoint)
* Grafana configured with Prometheus as a Datasource for  Dashboard construction.
* For Grafana dashboard, This demo is referring to  [dabz/ccloudexporter](https://github.com/Dabz/ccloudexporter) with updtaed metrics keys .

## How to run

### Step 1
* git clone Repo
* cd to *"kafka-docker-ws/ccloud/metrics-prometheus-grafana"*
### Step 2
* Edit/Update file ->   *./metrics-prometheus-grafana/config/prometheus/prometheus.yml*
* Update cCloud *"CLOUD-API-KEY"* and *"CLOUD-API-SECRET"* ( Note: Resource type= cloud Api-Key)
* Update *"resource.kafka.id"* with lkc-XXXX values ( it accept array of values)
* Update *"resource.connector.id"* with  lcc-XXXX values
* Update *"resource.ksql.id"* with lksqlc-XXXX values
* Update *"resource.schema_registry.id"* with lsrc-XXXX values
### Step 3

* Run docker compose command
 
     *docker-compose -f ccloud-metrics-export-docker-compose.yml up*

### Step 4 ( select dashboard config)
* Open Grafana ( http://localhost:3000 ) 
     userid: admin, password: admin
* Select Option to Browse Dashboards
* Select Import Option ( to create new dashboard )
* Import file *./metrics-prometheus-grafana/grafana/ccloud-sample-dashboard.json*
* open grafana dashboard to visualize cCloud 

### Step 5
* CTRL-C to exit

## Additional Links
* [ Confluent Cloud - Monitoring/Metrics api](https://docs.confluent.io/cloud/current/monitoring/metrics-api.html)
