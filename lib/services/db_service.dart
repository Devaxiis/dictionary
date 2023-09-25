import 'package:dictionary/library.dart';


sealed class DbService{
  static final db = FirebaseDatabase.instance;

  static Future<bool> storePost(String title, String content, bool isPublic)async{
    try{
      final folder = db.ref(Folder.post);
      final child = folder.push();
      final id = child.key!;
      final userId = AuthService.user.uid;

      final post =Post(id: id, title: title, content: content, userId: userId, isPublic: isPublic);
      await child.set(post.toJson());
      return true;
    }catch(e){
      debugPrint("Db Error: $e");
      return false;
    }
  }

  static Future<List<Post>> readAllPost()async{
    final folder = db.ref(Folder.post);
    final data = await folder.get();
    final json = jsonDecode(jsonEncode(data.value))as Map;
    return json.values.map((e) => Post.fromJson(e as Map<String, Object?>)).toList();
  }

  static Future<bool> deletePost(String postId)async{
    try{
      final fbPost = db.ref(Folder.post).child(postId);
      await fbPost.remove();
      return true;
    }catch(e){
      return false;
    }
  }

  static Future<bool> updatePost(String postId,String title,String content, bool isPublic)async{
    try{
      final fbPost = db.ref(Folder.post).child(postId);
      await fbPost.update({
        "title": title,
        "content": content,
        "isPublic": isPublic
      });
      return true;
    }catch(e){
      return false;
    }
  }



}

sealed class Folder{
  static const post = "Post";
}