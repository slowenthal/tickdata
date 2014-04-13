$1 != "time" {
  split(FILENAME,fileparts,".")
  ticker = fileparts[1];
  exchange = fileparts[2]
  year = substr($1,1,4);
  month = substr($1,5,2);
  day = substr($1,7,2);
  hour = substr($1,10,2);
  minute = substr($1,12,2);
  second = substr($1,14,2);
  printf("%s|%s|%s-%s-%s %s:%s:%s-0000|%s|%s|%s-%s-%s 00:00:00-0000\n",ticker,exchange,year,month,day,hour,minute,second,$2,$3,year,month,day);
}

