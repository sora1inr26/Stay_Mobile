import 'package:shared_preferences/shared_preferences.dart';
import 'package:stay/Models/EnumData.dart' as enumData;

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
 
//保存数据
void saveMethodName() async {
    SharedPreferences prefs = await _prefs;
    prefs.setString("strKey", "strValue");
    //prefs.setInt("intKey", "intValue");
}
 
//获取数据
void initFromCache() async {
    SharedPreferences prefs = await _prefs;
    String strValue = prefs.getString("strKey");
    //int intValue = prefs.getInt("intKey");
}

void setUserToken(String value) async{
    SharedPreferences prefs = await _prefs;
    String keyName = (enumData.localProp.userToken.toString());
    prefs.setString(keyName, value);
}