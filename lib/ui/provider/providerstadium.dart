
import 'package:test_toppfan/base/baseprovider.dart';
import 'package:test_toppfan/ui/model/responsestadium.dart';
import 'package:test_toppfan/ui/model/stadiummodel.dart';
import 'package:test_toppfan/ui/repository/repository.dart';


class ProviderStadium extends BaseProvider{
  
  final Repository repository = Repository();

  final List<Rows> _rowsList = [];
  List<Rows> get rowsList => _rowsList;
  
  int _numberColumnsMAx = 0;
  int get numberColumnsMAx => _numberColumnsMAx;

  ProviderStadium(){
    _getData();
  }


  Future<void> _getData() async {
    super.showLoader = true;

    final ResponseStadium response = await repository.getInfoStadium();
    if(response.isSuccess){
      rowsList.clear();
      if(response.stadiumModel.rows.isNotEmpty){
        final item = response.stadiumModel.rows.reduce((value, element) {
            if(value.seats.total > element.seats.total){
              return value;
            }else{
              return element;
            }
        });
        _numberColumnsMAx = item.seats.total;
        rowsList.addAll(response.stadiumModel.rows); 
      }else{
        super.emptyState = true;
        //TODO Se implemntaría una lógica para mostrar un emptystate
      }
    }else{
      //TODO Se implemntaría una lógica para mostrar el error proveniente de repositpory
      super.setTitleAndMessage("Error", response.message);
    }

    super.showLoader = false;
  }

  @override
  void dispose() {
    super.dispose();
    super.disposeStream();
  }

}