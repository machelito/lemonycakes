part of app;

const String _storageKey = "LemonyCakes_";
const List<String> _supportedLanguages = ['en','es','zh'];
Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class GlobalTranslations {
  Locale _locale;
  Map<dynamic, dynamic> _localizedValues;
  VoidCallback _onLocaleChangedCallback;

  Iterable<Locale> supportedLocales() => _supportedLanguages.map<Locale>((lang) => new Locale(lang, ''));

  List<String> getSupportedLanguages() => _supportedLanguages;

  String text(String key) {
    return (_localizedValues == null || _localizedValues[key] == null) ? '** $key not found' : _localizedValues[key];
  }

  get currentLanguage => _locale == null ? '' : _locale.languageCode;
  get locale => _locale;

  Future<Null> init([String language]) async {
    if (_locale == null){
      await setNewLanguage(language);
    }
    return null;
  }

  getPreferredLanguage() async {
    return _getApplicationSavedInformation('language');
  }
  setPreferredLanguage(String lang) async {
    return _setApplicationSavedInformation('language', lang);
  }

  Future<Null> setNewLanguage([String newLanguage, bool saveInPrefs = false]) async {
    String language = newLanguage;
    if (language == null){
      language = await getPreferredLanguage();
    }

    if (language == ""){
      language = _supportedLanguages[1];
    }
    _locale = Locale(language, "");

    String jsonContent = await rootBundle.loadString("assets/locale/i18n_${_locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);

    if (saveInPrefs){
      await setPreferredLanguage(language);
    }

    if (_onLocaleChangedCallback != null){
      _onLocaleChangedCallback();
    }

    return null;
  }

  set onLocaleChangedCallback(VoidCallback callback){
    _onLocaleChangedCallback = callback;
  }

  Future<int> getCurrentLanguageIndex() async {
    String preferredLanguage = await getPreferredLanguage();
    if (preferredLanguage == null || preferredLanguage.isEmpty) {
      return 1;
    }
    return _supportedLanguages.indexOf(preferredLanguage);
  }

  Future<String> _getApplicationSavedInformation(String name) async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(_storageKey + name) ?? '';
  }

  Future<bool> _setApplicationSavedInformation(String name, String value) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.setString(_storageKey + name, value);
  }


  ///
  /// Singleton Factory
  ///
  static final GlobalTranslations _translations = new GlobalTranslations._internal();
  factory GlobalTranslations() {
    return _translations;
  }
  GlobalTranslations._internal();
}

GlobalTranslations allTranslations = new GlobalTranslations();