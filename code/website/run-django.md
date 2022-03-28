# Django Run Procedures

#### Start Sequence
* Django is configured to auto-start upon server boot using the PM2 service.
To manually start Django, execute:
```
pm2 start stackprj.json
```

#### Stop Sequence
* To stop Django, execute:
```
pm2 stop stackprj.json
```

#### Status Sequence
* To check the run status of Django, execute:
```
pm2 status stackprj.json
```
