void main(){
  print('Fetching User Data');
  getUserData();
  print('Fetching Orders');
  getOrders();
  print('Fetching Products');
  getProducts();
}

Future<void> getOrders() async {
  print('Fetching Orders');
  await Future.delayed(Duration(seconds: 3));
  print('Got Orders');
}

Future<void> getProducts() async {
  print('Fetching Products');
  await Future.delayed(Duration(seconds: 2));
  print('Got Products');
}

Future<void> getUserData() async {
  print('Fetching User Data');
  await Future.delayed(Duration(seconds: 1));
  print('Got User Data');
}