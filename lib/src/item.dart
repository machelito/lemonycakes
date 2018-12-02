part of app;

class Item {

  String id;
  String title;
  String subtitle;
  String tag;
  String text;
  String imageUrl;
  String facebookUrl;
  String instagramUrl;
  String youtubeUrl;

  Item({
    this.id,
    this.title,
    this.subtitle,
    this.tag,
    this.text,
    this.imageUrl,
    this.facebookUrl,
    this.instagramUrl,
    this.youtubeUrl,
  });

  Item.fromSnapshot(DocumentSnapshot snapshot) {
    this.id = snapshot.documentID;
    this.title = snapshot['title'];
    this.subtitle = snapshot['subtitle'];
    this.tag = snapshot.documentID;
    this.text = snapshot['text'];
    this.imageUrl = snapshot['image_url'];
    this.facebookUrl = snapshot['facebook_url'];
    this.instagramUrl = snapshot['instagram_url'];
    this.youtubeUrl = snapshot['youtube_url'];
  }

}