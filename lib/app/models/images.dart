class Images {
  String xs;
  String sm;
  String md;
  String lg;
  Images({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      xs: json['xs'],
      sm: json['sm'],
      md: json['md'],
      lg: json['lg'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['xs'] = this.xs;
    data['sm'] = this.sm;
    data['md'] = this.md;
    data['lg'] = this.lg;
    return data;
  }
}
