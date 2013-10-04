#used because of the 2500 limit on geocoder. Google tracks usage by IP address. On Heroku the IP is shared and the limit is exceeded by others
Geocoder.configure(
  :http_proxy => 'quotaguard859:Az756bG4fTTx@QuotaGuard-1586506616.us-east-1.elb.amazonaws.com:9292',
  :timeout => 5
)
