class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({this.imageAssetPath, this.title, this.desc});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  sliderModel.setDesc(
      "with wise you can ask any question in any topic and find best answers .");
  sliderModel.setTitle("Asking");
  sliderModel.setImageAssetPath("images/main.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel.setDesc("you can ask and answer any Question anonymously.");
  sliderModel.setTitle("Anonymous");
  sliderModel.setImageAssetPath("images/owl5.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel
      .setDesc("Shareing your expiriences withe all people around the world.");
  sliderModel.setTitle("Sharing ");
  sliderModel.setImageAssetPath("images/an.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel
      .setDesc("Spaces is a group Chats for each topic and done annonymously.");
  sliderModel.setTitle("Spaces");
  sliderModel.setImageAssetPath("images/owl3.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
