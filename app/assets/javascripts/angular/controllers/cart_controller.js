function cartController($scope) {
  $scope.order_items = [
    {product_id: 1, quantity: 1, unit_price: 3.95},
    {product_id: 2, quantity: 1, unit_price: 12.95},
    {product_id: 3, quantity: 1, unit_price: 6.95}
  ];
  $scope.remove = function(index) {
    $scope.order_items.splice(index,1);
  };
  $scope.in= {
    product_id: 'id',
    quantity:0,
    unit_price:0
  };
  $scope.addItem = function () {
    $scope.order_items.push($scope.in);
    $scope.in = {
      product_id 'id',
      quantity:0,
      unit_price:0
    };
  };
};
