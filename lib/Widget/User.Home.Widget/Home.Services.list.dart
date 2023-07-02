
class ServicesNames{
  ServicesNames(
      {
        required this.index
      });
  int index;
  List<String> serviceName = ["Calculate\nEnergy Consumption","View\nPanels","service_3"];
  String getName(index){
    return serviceName[index];
  }
}