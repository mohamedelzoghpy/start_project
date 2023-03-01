abstract class ShopLoginStates{}
class ShopLoginInitialState extends ShopLoginStates{}
class ShopLoginLoadingState extends ShopLoginStates{}
class ShopLoginsSuccessState extends ShopLoginStates{}
class ShopLoginErrorState extends ShopLoginStates{
late final String error;

ShopLoginErrorState(this.error);
}
class ShopChangePasswordVisibilityState extends ShopLoginStates{}