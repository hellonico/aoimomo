
import ketai.sensors.*; 
import org.json.*;

KetaiLocation location;

double longitude, latitude, altitude;
String woeid = "", city = "", country = "", neighborhood = "", county = "", wimage = "";
String weather = "";

void setup() {
  size(displayWidth, displayHeight);
  orientation(LANDSCAPE);
  textAlign(CENTER, CENTER);
  textSize(34);
}

void draw() {
  background(78, 93, 75);
  
  if (location.getProvider() == "none")
    text("Location data is unavailable. \n" +
      "Please check your location settings.",  0, 0, width, height);
  else {
    
   String base = "Latitude: " + latitude + "\n" + 
      "Longitude: " + longitude + "\n" + 
      "Altitude: " + altitude + "\n" + 
      "Provider: " + location.getProvider() + "\n" + 
      "Woeid: " + woeid + "\n";
   if(city!="") {
     base += "Country: "+country +"\n";
     base += "City: "+city +"\n";
     base += "County: "+county +"\n";
     base += "Neighborhood: "+neighborhood +"\n";
   } 
   text(base,  0, 0, width/2, height);
   
   if(weather!="") 
    text(weather, width/2, 0, width/2, height);  
   
   if(wimage!="")
    image(loadImage(wimage, "gif"), width/2, height*2/3, width/10, width/10);
  }
}

void mousePressed() {
   background(78, 93, 75);
   getWeather(); 
}

// geolocate us
void getWOEID() {
  String req = "http://where.yahooapis.com/geocode?location="+latitude+"+"+longitude+"&gflags=R&flags=J";
  println(req.toString());
  String response = loadStrings( req )[0];
  try {
    JSONObject result = new JSONObject(response).getJSONObject("ResultSet").getJSONArray("Results").getJSONObject(0);
    println(result.toString());
    
    woeid = result.getString("woeid");
    country = result.getString("country");
    county = result.getString("county");
    city = result.getString("city");
    neighborhood = result.getString("neighborhood");
    
  } catch(Exception e) {
    println(e); 
  }
}

// check the weather around us
void getWeather() {
  if(woeid=="") return;
  try {
    String response = loadStrings("http://weather.yahooapis.com/forecastjson?u=c&w="+woeid)[0];
    JSONObject root = new JSONObject(response); 
    println(root.toString());
    weather = "";
    
    weather += "Wind Speed: "+ root.getJSONObject("wind").getString("speed") + "\n";
    weather += "Wind Direction: "+ root.getJSONObject("wind").getString("direction") + "\n";
    weather += "Sunset: "+root.getJSONObject("astronomy").getString("sunset") + "\n";
    weather += "Sunrise: "+root.getJSONObject("astronomy").getString("sunrise") + "\n";
    weather += "Condition: "+root.getJSONObject("condition").getString("text") + "\n";
    weather += "Temperature: "+root.getJSONObject("condition").getString("temperature") + "\n";
    
    weather += "Pressure: "+root.getJSONObject("atmosphere").getString("pressure") + "\n";
    weather += "Visibility: "+root.getJSONObject("atmosphere").getString("visibility") + "\n";
    weather += "Humidity: "+root.getJSONObject("atmosphere").getString("humidity") + "\n";
    
    wimage = root.getJSONObject("condition").getString("image");
    println("Loading Image:"+wimage);
    
  } catch (Exception e) {
    println(e);  
  }
}

void onResume()
{
  location = new KetaiLocation(this);
  super.onResume();
}


void onLocationEvent(double _latitude, double _longitude, double _altitude)
{
  longitude = _longitude;
  latitude = _latitude;
  altitude = _altitude;
  println("lat/lon/alt: " + latitude + "/" + longitude + "/" + altitude);
  getWOEID();
  getWeather();
}

