// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class GlobalValue {
  static double getWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double getHeight(BuildContext context) =>
      MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

  static double getSizeConstraint(BuildContext context, double value) =>
      getWidth(context) * (value / 1080);

  static final Color backgroundColor = const Color(0xFF49C8FF);

  static final Color buttonColor = const Color(0xFF5ECEFF);

  static final Map<String, Map<String, dynamic>> resultConsultation = {
    "P1": {
      "result":
          "Dari gejala yang telah Kamu jawab sebelumnya, hasil diagnosa yang didapat yaitu anda menderita Influenza",
      "solution": [
        "Perbanyak minum air putih",
        "Istirahat",
        "Mengonsumsi obat penghilang rasa sakit"
      ],
      "suggestion": [
        "XZzonPy4GprBPLvyCRY6",
        "vUa8plTWjpUl5c4Vgq3S",
        "UPiMiRjK4gfb86Tjt39k",
      ],
    },
    "P2": {
      "result":
          "Dari gejala yang telah Kamu jawab sebelumnya, hasil diagnosa yang didapat yaitu anda menderita Pusing",
      "solution": [
        "Olahraga",
        "Minum air putih",
        "Perbanyak konsumsi makanan yang mengandung zat besi",
        "Menghentikan konsumsi kafein (coffee)"
      ],
      "suggestion": [
        "wUDxUiEDq07ibxxGNLBB",
        "i5Ii3aoSmQhCtBZ1Fge3",
        "QVs2eAtPsULo5SLjA6FD",
        "c3MJjxWzcxpNs0AZSV8p",
      ],
    },
    "P3": {
      "result":
          "Dari gejala yang telah Kamu jawab sebelumnya, hasil diagnosa yang didapat yaitu anda menderita Batuk",
      "solution": [
        "Hindari rokok",
        "Hindari makanan berminyak",
        "Perbanyak minum air putih disarankan air hangat",
        "Air hangat dicampur jeruk nipis",
        "Jika batuk mengeluarkan darah, segera periksa ke dokter"
      ],
      "suggestion": [
        "wtHxAjShKYuMVCPo2sZ1",
        "jjkEjn0M89EzNvBW8sUV",
        "gNTDnUQex5RHyyWjIlST",
        "2LeqxwS1bfzVxQjWfTcf",
      ],
    },
    "P4": {
      "result":
          "Dari gejala yang telah Kamu jawab sebelumnya, hasil diagnosa yang didapat yaitu anda menderita Pilek",
      "solution": [
        "Rutin menjaga kebersihan tangan",
        "Menggunakan masker",
        "Makan makanan bergizi",
        "Obat antialergi"
      ],
      "suggestion": [
        "W6d3aIqMbrEADcbhlCUe",
        "wVMWwuM9BAqRsZld8vVh",
        "0mwmN7rj6rOzl7NZ1VpW",
      ],
    },
    "P5": {
      "result":
          "Dari gejala yang telah Kamu jawab sebelumnya, hasil diagnosa yang didapat yaitu anda menderita Cacar Air",
      "solution": [
        "Mengoleskan salep pereda gatal",
        "Mandi air dicampur baking soda",
        "Jangan menggaruk kulit",
        "Kompres dingin"
      ],
      "suggestion": [
        "VRpfZ5rNe9wHdak7vZEf",
        "PEYQT2Gv2Y1S11Qlpllu",
        "kA5h2UMAsCc5icSp1Q4L",
      ],
    },
    "P6": {
      "result":
          "Dari gejala yang telah Kamu jawab sebelumnya, hasil diagnosa yang didapat yaitu anda menderita Nyeri Sendi",
      "solution": [
        "Istirahat",
        "Tidak melakukan aktivitas berat",
        "Konsumsi obat pereda nyeri otot",
        "Lakukan peregangan ringan"
      ],
      "suggestion": [
        "jURTGE9GZjX6lGLmmqy1",
        "TNfvTYzPSg6KyNPLcwUA",
        "6YrF0btFZhgmAjBrTsJ1",
      ],
    },
    "P7": {
      "result":
          "Dari gejala yang telah Kamu jawab sebelumnya, hasil diagnosa yang didapat yaitu anda menderita Tifus",
      "solution": [
        "Makan makanan tinggi kalori, protei, rendah serat",
        "Istirahat total",
        "Minum air putih"
      ],
      "suggestion": [
        "Y2FbglYTkEERoI3BWfCw",
        "tJ9hQXrxU8Eu3ZwEZMAg",
        "6hyBkBBQRSKosAREqW5i",
      ],
    },
    "P8": {
      "result":
          "Dari gejala yang telah Kamu jawab sebelumnya, hasil diagnosa yang didapat yaitu anda menderita Cacingan",
      "solution": [
        "Menjaga kebersihan tangan dan makanan",
        "Minum air kelapa",
        "Konsumsi bawang putih"
      ],
      "suggestion": [
        "tXcFbaCjN6zfiYTgfkSM",
        "9djixt200L7L23cPgpLM",
        "jiVldaWdRGM9OlL5U5ZE",
      ],
    },
    "P9": {
      "result":
          "Dari gejala yang telah Kamu jawab sebelumnya, hasil diagnosa yang didapat yaitu anda menderita Diare",
      "solution": [
        "Menghindari barang2 pribadi yang dipakai bersama",
        "Cuci tangan teratur",
        "Menjaga kebersihan makanan"
      ],
      "suggestion": [
        "qeCqTiunAtncC4DyRZem",
        "dTpq9FgTlaStVqbQgv6H",
        "2Gmh3entRi1vwW28TPs3",
      ],
    },
    "P10": {
      "result":
          "Dari gejala yang telah Kamu jawab sebelumnya, hasil diagnosa yang didapat yaitu anda menderita Radang Tenggorokan",
      "solution": [
        "Perbanyak minum air putih",
        "Konsumsi makanan lembut",
        "Berhenti merokok"
      ],
      "suggestion": [
        "Y68lkYqKFztBIrxqsNaC",
        "qOpHBaRvPBeP6EtvmNQQ",
        "PC4iTF2LyV9RPIBvBDU7",
      ],
    },
  };
}
