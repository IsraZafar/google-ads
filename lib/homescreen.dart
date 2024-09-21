import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  BannerAd? myBanner;

  @override
  void initState() {
    super.initState();

    myBanner = BannerAd(
      adUnitId: "ca-app-pub-3940256099942544/6300978111", // Test Ad Unit ID
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('Ad loaded.');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('Ad failed to load: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) {
          print('Ad opened.');
        },
        onAdClosed: (Ad ad) {
          print('Ad closed.');
        },
      ),
    );

    myBanner!.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Ads"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (myBanner != null)
              Container(
                alignment: Alignment.center,
                child: AdWidget(ad: myBanner!),
                width: myBanner!.size.width.toDouble(),
                height: myBanner!.size.height.toDouble(),
              ),
            // Add other widgets here
          ],
        ),
      ),
    );
  }
}
