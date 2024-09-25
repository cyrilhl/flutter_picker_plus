import 'package:flutter/material.dart';

abstract class PickerLocalizationsBase {
  final Locale? locale;
  const PickerLocalizationsBase(this.locale);
  Object? getItem(String key);
  String? get cancelText => getItem('cancelText') as String;
  String? get confirmText => getItem('confirmText') as String;
  List? get ampm => getItem('ampm') as List;
  List? get months => getItem('months') as List;
  List? get monthsLong => getItem('monthsLong') as List;
}

/// localizations
class PickerLocalizations extends PickerLocalizationsBase {
  static const PickerLocalizations _static = PickerLocalizations(null);
  const PickerLocalizations(super.locale);

  @override
  Object? getItem(String key) {
    Map? localData;
    if (locale != null) {
      localData = localizedValues[locale!.languageCode];
    }
    if (localData == null) return localizedValues['en']![key];
    return localData[key];
  }

  static PickerLocalizations of(BuildContext context) {
    return Localizations.of<PickerLocalizations>(
            context, PickerLocalizations) ??
        _static;
  }

  /// 注册自定义语言
  ///
  /// Register custom language
  static registerCustomLanguage(String name,
      {String? cancelText,
      String? confirmText,
      List<String>? ampm,
      List<String>? months,
      List<String>? monthsLong}) {
    if (name.isEmpty) return;
    if (ampm != null && ampm.length != 2) {
      throw Exception('ampm array length must be 2');
    }
    if (months != null && months.length != 12) {
      throw Exception('months array length must be 12');
    }
    if (monthsLong != null && monthsLong.length != 12) {
      throw Exception('monthsLong array length must be 12');
    }
    if (!languages.contains(name)) {
      languages.add(name);
    }
    final defaultValue = localizedValues['en']!;
    final data = {
      'cancelText': cancelText ?? defaultValue['cancelText'] as String,
      'confirmText': cancelText ?? defaultValue['confirmText'] as String,
      'ampm': ampm ?? defaultValue['ampm'] as List,
    };
    if (months != null) {
      data['months'] = months;
    }
    if (monthsLong != null) {
      data['monthsLong'] = monthsLong;
    }
    localizedValues[name] = data;
  }

  /// Language Support
  static const List<String> languages = [
    'en',
    'ja',
    'zh',
    'ko',
    'it',
    'ar',
    'fr',
    'es',
    'tr',
    'ro',
    'de',
    'pt',
    'el',
    'hi',
    'bn',
    'ru',
    'ur',
    'id',
  ];

  /// Language Values
  static const Map<String, Map<String, Object>> localizedValues = {
    'en': {
      'cancelText': 'CANCEL',
      'clearText': 'CLEAR',
      'confirmText': 'SET',
      'ampm': ['AM', 'PM'],
      'months': [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
      ],
      'monthsLong': [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
      ],
    },
    'ja': {
      'cancelText': 'キャンセル',
      'confirmText': '完了',
      'ampm': ['午前', '午後'],
      'months': [
        "1月",
        "2月",
        "3月",
        "4月",
        "5月",
        "6月",
        "7月",
        "8月",
        "9月",
        "10月",
        "11月",
        "12月",
      ],
      'monthsLong': [
        "1月",
        "2月",
        "3月",
        "4月",
        "5月",
        "6月",
        "7月",
        "8月",
        "9月",
        "10月",
        "11月",
        "12月",
      ],
    },
    'zh': {
      'cancelText': '取消',
      'confirmText': '确定',
      'ampm': ['上午', '下午'],
      'months': [
        "1月",
        "2月",
        "3月",
        "4月",
        "5月",
        "6月",
        "7月",
        "8月",
        "9月",
        "10月",
        "11月",
        "12月",
      ],
      'monthsLong': [
        "一月",
        "二月",
        "三月",
        "四月",
        "五月",
        "六月",
        "七月",
        "八月",
        "九月",
        "十月",
        "十一月",
        "十二月"
      ],
    },
    'ko': {
      'cancelText': '취소',
      'confirmText': '확인',
      'ampm': ['오전', '오후'],
      'months': [
        "1월",
        "2월",
        "3월",
        "4월",
        "5월",
        "6월",
        "7월",
        "8월",
        "9월",
        "10월",
        "11월",
        "12월",
      ],
      'monthsLong': [
        "1월",
        "2월",
        "3월",
        "4월",
        "5월",
        "6월",
        "7월",
        "8월",
        "9월",
        "10월",
        "11월",
        "12월",
      ],
    },
    'it': {
      'cancelText': 'Annulla',
      'confirmText': 'Conferma',
      'ampm': ['AM', 'PM'],
      'months': [
        "gen",
        "feb",
        "mar",
        "apr",
        "mag",
        "giu",
        "lug",
        "ago",
        "set",
        "ott",
        "nov",
        "dic",
      ],
      'monthsLong': [
        "gennaio",
        "febbraio",
        "marzo",
        "aprile",
        "maggio",
        "giugno",
        "luglio",
        "agosto",
        "settembre",
        "ottobre",
        "novembre",
        "dicembre"
      ],
    },
    'ar': {
      'cancelText': 'إلغاء الأمر',
      'confirmText': 'تأكيد',
      'ampm': ['صباحاً', 'مساءً'],
      'months': [
        "ينا",
        "فبر",
        "مار",
        "أب",
        "ماي",
        "يون",
        "يول",
        "أغس",
        "سب",
        "أكت",
        "نوف",
        "ديس",
      ],
      'monthsLong': [
        "يناير",
        "فبراير",
        "مارس",
        "أبريل",
        "مايو",
        "يونيو",
        "يوليو",
        "أغسطس",
        "سبتمبر",
        "أكتوبر",
        "نوفمبر",
        "ديسمبر"
      ],
    },
    'fr': {
      'cancelText': 'Annuler',
      'confirmText': 'Confirmer',
      'ampm': ['Matin', 'Après-midi'],
      'months': [
        "janv",
        "févr",
        "mars",
        "avr",
        "mai",
        "juil",
        "Jul",
        "août",
        "sept",
        "oct",
        "nov",
        "déc",
      ],
      'monthsLong': [
        "janvier",
        "février",
        "mars",
        "avril",
        "mai",
        "juin",
        "juillet",
        "août",
        "septembre",
        "octobre",
        "novembre",
        "décembre"
      ],
    },
    'es': {
      'cancelText': 'Cancelar',
      'confirmText': 'Confirmar',
      'ampm': ['AM', 'PM'],
      'months': [
        "ene",
        "feb",
        "mar",
        "abr",
        "may",
        "jun",
        "jul",
        "ago",
        "sep",
        "oct",
        "nov",
        "dic",
      ],
      'monthsLong': [
        "enero",
        "febrero",
        "marzo",
        "abril",
        "mayo",
        "junio",
        "julio",
        "agosto",
        "septiembre",
        "octubre",
        "noviembre",
        "diciembre"
      ],
    },
    'tr': {
      'cancelText': 'İptal',
      'confirmText': 'Onay',
      'ampm': ['ÖÖ', 'ÖS'],
      'months': [
        'Oca',
        'Şub',
        'Mar',
        'Nis',
        'May',
        'Haz',
        'Tem',
        'Ağu',
        'Eyl',
        'Eki',
        'Kas',
        'Ara'
      ],
      'monthsLong': [
        'Ocak',
        'Şubat',
        'Mart',
        'Nisan',
        'Mayıs',
        'Haziran',
        'Temmuz',
        'Ağustos',
        'Eylül',
        'Ekim',
        'Kasım',
        'Aralık'
      ],
    },
    'ro': {
      'cancelText': 'Anulează',
      'confirmText': 'Confirmă',
      'ampm': ['AM', 'PM'],
      'months': [
        'Ian',
        'Feb',
        'Mart',
        'Apr',
        'Mai',
        'Iun',
        'Iul',
        'Aug',
        'Sept',
        'Oct',
        'Nov',
        'Dec',
      ],
      'monthsLong': [
        'Ianuarie',
        'Februarie',
        'Martie',
        'Aprilie',
        'Mai',
        'Iunie',
        'Iulie',
        'August',
        'Septembrie',
        'Octombrie',
        'Noiembrie',
        'Decembrie',
      ],
    },
    'de': {
      'cancelText': 'Abbruch',
      'confirmText': 'Bestätigen',
      'ampm': ['AM', 'PM'],
      'months': [
        'Jan',
        'Feb',
        'Mrz',
        'Apr',
        'Mai',
        'Jun',
        'Jul',
        'Aug',
        'Sept',
        'Okt',
        'Nov',
        'Dez',
      ],
      'monthsLong': [
        'Januar',
        'Februar',
        'März',
        'April',
        'Mai',
        'Juni',
        'Juli',
        'August',
        'September',
        'October',
        'November',
        'Dezember',
      ],
    },
    'pt': {
      'cancelText': 'Cancelar',
      'confirmText': 'Confirme',
      'ampm': ['AM', 'PM'],
      'months': [
        "Jan",
        "Fev",
        "Mar",
        "Abr",
        "Mai",
        "Jun",
        "Jul",
        "Ago",
        "Set",
        "Out",
        "Nov",
        "Dez",
      ],
      'monthsLong': [
        "Janeiro",
        "Fevereiro",
        "Março",
        "Abril",
        "Maio",
        "Junho",
        "Julho",
        "Agosto",
        "Setmbro",
        "Outubro",
        "Novembro",
        "Dezembro"
      ],
    },
    'el': {
      'cancelText': 'ακύρωση',
      'confirmText': 'Επιβεβαιώνω',
      'ampm': ['AM', 'PM'],
      'months': [
        "Ιαν",
        "Φεβ",
        "Μαρ",
        "Απρ",
        "Μάι",
        "Ιούν",
        "Ιούλ",
        "Αύγ",
        "Σεπ",
        "Οκτ",
        "Νοέ",
        "Δεκ",
      ],
      'monthsLong': [
        "Ιανουάριος",
        "Φεβρουάριος",
        "Μάρτιος",
        "Απρίλιος",
        "Μάιος",
        "Ιούνιος",
        "Ιούλιος",
        "Αύγουστος",
        "Σεπτέμβριος",
        "Οκτώβριος",
        "Νοέμβριος",
        "Δεκέμβριος"
      ],
    },
    'hi': {
      'cancelText': 'रद्द करें',
      'confirmText': 'पुष्टि करें',
      'ampm': ['पूर्वाह्न', 'अपराह्न'],
      'months': [
        "जन",
        "फर",
        "मार्च",
        "अप्रै",
        "मई",
        "जून",
        "जुल",
        "अग",
        "सित",
        "अक्ट",
        "नव",
        "दिस",
      ],
      'monthsLong': [
        "जनवरी",
        "फरवरी",
        "मार्च",
        "अप्रैल",
        "मई",
        "जून",
        "जुलाई",
        "अगस्त",
        "सितंबर",
        "अक्टूबर",
        "नवंबर",
        "दिसंबर"
      ],
    },
    'bn': {
      'cancelText': 'বাতিল করুন',
      'confirmText': 'নিশ্চিত করুন',
      'ampm': ['এএম', 'পিএম'],
      'months': [
        "জানু",
        "ফেব",
        "মার্চ",
        "এপ্রি",
        "মে",
        "জুন",
        "জুল",
        "অগ",
        "সেপ",
        "অক্ট",
        "নভে",
        "ডিসে",
      ],
      'monthsLong': [
        "জানুয়ারি",
        "ফেব্রুয়ারি",
        "মার্চ",
        "এপ্রিল",
        "মে",
        "জুন",
        "জুলাই",
        "অগাস্ট",
        "সেপ্টেম্বর",
        "অক্টোবর",
        "নভেম্বর",
        "ডিসেম্বর"
      ],
    },
    'ru': {
      'cancelText': 'Отмена',
      'confirmText': 'Подтвердить',
      'ampm': ['AM', 'PM'],
      'months': [
        "Янв",
        "Фев",
        "Мар",
        "Апр",
        "Май",
        "Июн",
        "Июл",
        "Авг",
        "Сен",
        "Окт",
        "Ноя",
        "Дек",
      ],
      'monthsLong': [
        "Январь",
        "Февраль",
        "Март",
        "Апрель",
        "Май",
        "Июнь",
        "Июль",
        "Август",
        "Сентябрь",
        "Октябрь",
        "Ноябрь",
        "Декабрь"
      ],
    },
    'ur': {
      'cancelText': 'منسوخ کریں',
      'confirmText': 'تصدیق کریں',
      'ampm': ['صبح', 'شام'],
      'months': [
        "جن",
        "فر",
        "مارچ",
        "اپر",
        "مئ",
        "جون",
        "جل",
        "اگ",
        "ستم",
        "اکت",
        "نوم",
        "دسم",
      ],
      'monthsLong': [
        "جنوری",
        "فروری",
        "مارچ",
        "اپریل",
        "مئ",
        "جون",
        "جولائی",
        "اگست",
        "ستمبر",
        "اکتوبر",
        "نومبر",
        "دسمبر"
      ],
    },
    'id': {
      'cancelText': 'Batal',
      'confirmText': 'Konfirmasi',
      'ampm': ['AM', 'PM'],
      'months': [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "Mei",
        "Jun",
        "Jul",
        "Agu",
        "Sep",
        "Okt",
        "Nov",
        "Des",
      ],
      'monthsLong': [
        "Januari",
        "Februari",
        "Maret",
        "April",
        "Mei",
        "Juni",
        "Juli",
        "Agustus",
        "September",
        "Oktober",
        "November",
        "Desember"
      ],
    },
  };
}
