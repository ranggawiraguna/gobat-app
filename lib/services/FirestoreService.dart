import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gobat_app/models/Article.dart';
import 'package:gobat_app/models/Product.dart';
import 'package:gobat_app/models/User.dart';

class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<User>> get users => firestore.collection("users").snapshots().map(
        (QuerySnapshot querySnapshot) => querySnapshot.docs
            .map(
              (DocumentSnapshot documentSnapshot) => User(
                id: documentSnapshot.id,
                username: documentSnapshot.get("username"),
                password: documentSnapshot.get("password"),
                fullname: documentSnapshot.get("fullname"),
                email: documentSnapshot.get("email"),
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

  Stream<List<Article>> get articles =>
      firestore.collection("articles").snapshots().map(
            (QuerySnapshot querySnapshot) => querySnapshot.docs
                .map(
                  (DocumentSnapshot documentSnapshot) => Article(
                    id: documentSnapshot.id,
                    title: documentSnapshot.get("title"),
                    description: documentSnapshot.get("description"),
                  ),
                )
                .toList(),
          );

  Stream<List<Article>> article(String articleId) =>
      firestore.collection("articles").snapshots().map(
            (QuerySnapshot querySnapshot) =>
                querySnapshot.docs
                    .map((DocumentSnapshot documentSnapshot) {
                      if (documentSnapshot.id == articleId) {
                        return Article(
                          id: documentSnapshot.id,
                          title: documentSnapshot.get("title"),
                          description: documentSnapshot.get("description"),
                        );
                      }
                    })
                    .toList()
                    .reduce((value, element) {
                      if ((element != null) && (element.id == articleId))
                        return element;
                    }) ??
                Article.empty,
          );

  Stream<List<Product>> get products =>
      firestore.collection("products").snapshots().map(
            (QuerySnapshot querySnapshot) => querySnapshot.docs
                .map(
                  (DocumentSnapshot documentSnapshot) => Product(
                    id: documentSnapshot.id,
                    name: documentSnapshot.get("name"),
                    description: documentSnapshot.get("description"),
                  ),
                )
                .toList(),
          );

  Stream<List<Product>> product(String productId) =>
      firestore.collection("products").snapshots().map(
            (QuerySnapshot querySnapshot) =>
                querySnapshot.docs
                    .map((DocumentSnapshot documentSnapshot) {
                      if (documentSnapshot.id == productId) {
                        return Product(
                          id: documentSnapshot.id,
                          name: documentSnapshot.get("name"),
                          description: documentSnapshot.get("description"),
                        );
                      }
                    })
                    .toList()
                    .reduce((value, element) {
                      if ((element != null) && (element.id == productId))
                        return element;
                    }) ??
                Product.empty,
          );
}
