import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_toppfan/commonresources/colors_app.dart';
import 'package:test_toppfan/commonresources/strings_app.dart';
import 'package:test_toppfan/ui/provider/providerstadium.dart';
import 'package:test_toppfan/widgets/appbar_custom.dart';
import 'package:test_toppfan/widgets/body_custom.dart';
import 'package:test_toppfan/widgets/bottom_sheet_custom.dart';
import 'package:test_toppfan/widgets/loader_provider.dart';

class Stadium extends StatefulWidget {
  @override
  _StadiumState createState() => _StadiumState();
}

class _StadiumState extends State<Stadium> {
  ProviderStadium provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProviderStadium>(context, listen: true);

    return Scaffold(
      appBar: this._buildToolbar(),
      body: this._buildPage(provider),
    );
  }

  Widget _buildToolbar() {
    return AppBarCustom(
      elevation: 4.0,
      colorBackground: ColorsApp.primaryColor,
      allowMenu: false,
    );
  }

  Widget _buildPage(final ProviderStadium provider) {
    return BodyCustom().setBody(
        loader: Consumer<ProviderStadium>(builder: (context, provider, _) {
          return LoaderProvider().showOrHideLoader(
              show: provider.showLoader, message: StringsApp.loaderLoadRows);
        }),
        body: this._buildZoomScreen(provider));
  }

  Widget _buildZoomScreen(ProviderStadium provider) {
    return Center(
      child: InteractiveViewer(
        panEnabled: true, // Set it to false to prevent panning.
        boundaryMargin: EdgeInsets.all(80),
        minScale: 0.5,
        maxScale: 4,
        child: _buildBody(provider),
      ),
    );
  }

  _buildBody(ProviderStadium provider) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: provider.rowsList.length,
        itemBuilder: (BuildContext context, int indexRow) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(provider.rowsList[indexRow].name),
                _buildColumns(provider, indexRow),
              ],
            ),
          );
        });
  }

  Widget _buildColumns(ProviderStadium provider, int indexRow) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * .93,
          height: 30.0,
          child: ListView.builder(
              padding: EdgeInsets.all(5.0),
              shrinkWrap: true,
              itemCount: provider.rowsList[indexRow].seats.total +
                  provider.rowsList[indexRow].seats.start,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, indexSeats) {
                return Container(
                  height: 30,
                  width: 20,
                  margin: EdgeInsets.only(left: 4, right: 4),
                  alignment: Alignment.center,
                  child:
                      provider.rowsList[indexRow].seats.start + 1 > indexSeats
                          ? Container()
                          : _buildSeat(
                              provider.rowsList[indexRow].seats.start,
                              provider.rowsList[indexRow].seats.onHoldSale,
                              indexSeats),
                );
              }),
        ),
      ],
    );
  }

  Widget _buildSeat(int seatStart, List<String> seatsHold, int indexCurrent) {
    int seatIndex = indexCurrent - seatStart;
    return GestureDetector(
      onTap: () {
        BottomSheetCustom().showButtonSheetCustom(
            context: context,
            title: Text(
              StringsApp.titleMessageSeat,
              style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  color: Colors.black),
            ),
            message: Text(
                seatsHold.any((element) => element == seatIndex.toString())
                    ? StringsApp.messageSeatInUse
                    : StringsApp.messageSeatAllow,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Colors.black)));
      },
      child: Container(
        decoration: BoxDecoration(
            color: seatsHold.any((element) => element == seatIndex.toString())
                ? Colors.grey
                : Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
