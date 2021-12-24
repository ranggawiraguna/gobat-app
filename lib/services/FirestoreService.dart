import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  T? cast<T>(x) => x is T ? x : null;

  void addUser(Map<String, dynamic> user) =>
      firestore.collection("users").add(user);

  void updateUser({
    required String userId,
    required Map<String, dynamic> newData,
    Function? nextAction,
  }) {
    FirestoreService()
        .firestore
        .collection("users")
        .doc(userId)
        .update(newData)
        .whenComplete(() => (nextAction != null) ? nextAction() : null);
  }

  Stream<List<User>> get users => firestore.collection("users").snapshots().map(
        (QuerySnapshot querySnapshot) => querySnapshot.docs
            .map(
              (DocumentSnapshot documentSnapshot) => User(
                id: documentSnapshot.id,
                username: documentSnapshot.get("username"),
                password: documentSnapshot.get("password"),
                fullname: documentSnapshot.get("fullname"),
                email: documentSnapshot.get("email"),
                image: documentSnapshot.get("image"),
                favorites: Map<String, List<dynamic>>.from(
                  documentSnapshot.get("favorites"),
                ).map(
                  (key, value) => MapEntry(
                    key,
                    List<String>.from(value),
                  ),
                ),
                views: Map<String, List<dynamic>>.from(
                  documentSnapshot.get("views"),
                ).map(
                  (key, value) => MapEntry(
                    key,
                    List<String>.from(value),
                  ),
                ),
              ),
            )
            .toList(),
      );

  Stream<User> user(String userId) =>
      firestore.collection("users").snapshots().map(
            (QuerySnapshot querySnapshot) =>
                querySnapshot.docs
                    .map((DocumentSnapshot documentSnapshot) {
                      if (documentSnapshot.id == userId) {
                        return User(
                          id: documentSnapshot.id,
                          username: documentSnapshot.get("username"),
                          password: documentSnapshot.get("password"),
                          fullname: documentSnapshot.get("fullname"),
                          email: documentSnapshot.get("email"),
                          image: documentSnapshot.get("image"),
                          favorites: Map<String, List<dynamic>>.from(
                            documentSnapshot.get("favorites"),
                          ).map(
                            (key, value) => MapEntry(
                              key,
                              List<String>.from(value),
                            ),
                          ),
                          views: Map<String, List<dynamic>>.from(
                            documentSnapshot.get("views"),
                          ).map(
                            (key, value) => MapEntry(
                              key,
                              List<String>.from(value),
                            ),
                          ),
                        );
                      }
                    })
                    .toList()
                    .reduce((value, element) {
                      if ((element != null) && (element.id == userId)) {
                        return element;
                      } else {
                        return value;
                      }
                    }) ??
                User.empty,
          );

  void updateArticle({
    required String articleId,
    required Map<String, dynamic> newData,
    Function? nextAction,
  }) {
    FirestoreService()
        .firestore
        .collection("articles")
        .doc(articleId)
        .update(newData)
        .whenComplete(() => (nextAction != null) ? nextAction() : null);
  }

  Stream<List<Article>> get articles => firestore
      .collection("articles")
      .snapshots()
      .map(
        (QuerySnapshot querySnapshot) => querySnapshot.docs
            .map(
              (DocumentSnapshot documentSnapshot) => Article(
                id: documentSnapshot.id,
                counter: Map<String, int>.from(documentSnapshot.get("counter"))
                    .map((key, value) => MapEntry(key, cast<int>(value) ?? 0)),
                information: Map<String, dynamic>.from(
                    documentSnapshot.get("information")),
              ),
            )
            .toList(),
      );

  Stream<Article> article(String articleId) => firestore
      .collection("articles")
      .snapshots()
      .map(
        (QuerySnapshot querySnapshot) =>
            querySnapshot.docs
                .map((DocumentSnapshot documentSnapshot) {
                  if (documentSnapshot.id == articleId) {
                    return Article(
                      id: documentSnapshot.id,
                      counter:
                          Map<String, int>.from(documentSnapshot.get("counter"))
                              .map((key, value) =>
                                  MapEntry(key, cast<int>(value) ?? 0)),
                      information: Map<String, dynamic>.from(
                          documentSnapshot.get("information")),
                    );
                  }
                })
                .toList()
                .reduce((value, element) {
                  if ((element != null) && (element.id == articleId)) {
                    return element;
                  } else {
                    return value;
                  }
                }) ??
            Article.empty,
      );

  void updateProduct({
    required String productId,
    required Map<String, dynamic> newData,
    Function? nextAction,
  }) {
    FirestoreService()
        .firestore
        .collection("products")
        .doc(productId)
        .update(newData)
        .whenComplete(() => (nextAction != null) ? nextAction() : null);
  }

  Stream<List<Product>> get products => firestore
      .collection("products")
      .snapshots()
      .map(
        (QuerySnapshot querySnapshot) => querySnapshot.docs
            .map(
              (DocumentSnapshot documentSnapshot) => Product(
                id: documentSnapshot.id,
                category: documentSnapshot.get("category"),
                counter: Map<String, int>.from(documentSnapshot.get("counter"))
                    .map((key, value) => MapEntry(key, cast<int>(value) ?? 0)),
                information: Map<String, dynamic>.from(
                    documentSnapshot.get("information")),
              ),
            )
            .toList(),
      );

  Stream<Product> product(String productId) => firestore
      .collection("products")
      .snapshots()
      .map(
        (QuerySnapshot querySnapshot) =>
            querySnapshot.docs
                .map((DocumentSnapshot documentSnapshot) {
                  if (documentSnapshot.id == productId) {
                    return Product(
                      id: documentSnapshot.id,
                      category: documentSnapshot.get("category"),
                      counter:
                          Map<String, int>.from(documentSnapshot.get("counter"))
                              .map((key, value) =>
                                  MapEntry(key, cast<int>(value) ?? 0)),
                      information: Map<String, dynamic>.from(
                        documentSnapshot.get("information"),
                      ),
                    );
                  }
                })
                .toList()
                .reduce((value, element) {
                  if ((element != null) && (element.id == productId)) {
                    return element;
                  } else {
                    return value;
                  }
                }) ??
            Product.empty,
      );
}
