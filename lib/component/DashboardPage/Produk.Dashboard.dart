import 'package:GUDANGPROJECT/api/models/jenisproduk/jenisproduk.model.dart';
import 'package:GUDANGPROJECT/api/models/order/order.model.dart';
import 'package:GUDANGPROJECT/api/utils/apiService.dart';
import 'package:GUDANGPROJECT/component/LoginPage/Login.Validation.dart';
import 'package:GUDANGPROJECT/component/OrderPage/Order.Input.dart';
import 'package:GUDANGPROJECT/utils/constant_color.dart';
import 'package:GUDANGPROJECT/utils/constant_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ProdukDashboard extends StatefulWidget {
  @override
  _ProdukDashboard createState() => _ProdukDashboard();
}

class _ProdukDashboard extends State<ProdukDashboard> {
  SharedPreferences sp;
  ApiService _apiService = ApiService();
  bool isSuccess = false;
  var access_token, refresh_token, idcustomer, email, nama_customer, nama;

  cekToken() async {
    sp = await SharedPreferences.getInstance();
    access_token = sp.getString("access_token");
    refresh_token = sp.getString("refresh_token");
    idcustomer = sp.getString("idcustomer");
    email = sp.getString("email");
    nama_customer = sp.getString("nama_customer");
    //checking jika token kosong maka di arahkan ke menu login jika tidak akan meng-hold token dan refresh token
    if (access_token == null) {
      showAlertDialog(context);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()),
          (Route<dynamic> route) => false);
    } else {
      _apiService.checkingToken(access_token).then((value) => setState(() {
            isSuccess = value;
            //checking jika token expired/tidak berlaku maka akan di ambilkan dari refresh token
            if (!isSuccess) {
              _apiService
                  .refreshToken(refresh_token)
                  .then((value) => setState(() {
                        var newtoken = value;
                        //setting access_token dari refresh_token
                        if (newtoken != "") {
                          sp.setString("access_token", newtoken);
                          access_token = newtoken;
                        } else {
                          showAlertDialog(context);
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginPage()),
                              (Route<dynamic> route) => false);
                        }
                      }));
            }
          }));
    }
  }

  @override
  void initState() {
    super.initState();
    cekToken();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _apiService.listJenisProduk(access_token),
      builder:
          (BuildContext context, AsyncSnapshot<List<JenisProduk>> snapshot) {
        print("hmm : ${snapshot.connectionState}");
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return Center(
            child: Text(
                "Something wrong with message: ${snapshot.error.toString()}"),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          List<JenisProduk> profiles = snapshot.data;
          return _buildlistview(profiles);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildlistview(List<JenisProduk> dataIndex) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      // height: MediaQuery.of(context).size.height * 0.35,
      height: 100,
      margin: EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          JenisProduk jenisProduk = dataIndex[index];
          return GestureDetector(
              onTap: () {
                if (idcustomer == "0") {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(
                        'Anda Harus Melengkapi profile untuk melakukan transaksi!'),
                    duration: Duration(seconds: 10),
                  ));
//                        Navigator.pop(context, false);
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return FormInputOrder(
                      jenisProduk: jenisProduk,
                    );
                  }));
                }
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: EdgeInsets.all(8),
                height: 64,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: mFillColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: mBorderColor, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        jenisProduk.kapasitas,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: mTitleColor),
                      ),
                      Text(
                        jenisProduk.nama_kota,
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: mSubtitleColor),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

//   Widget _buildListView(List<JenisProduk> dataIndex) {
//     return Container(
//         // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
//         // height: MediaQuery.of(context).size.height * 0.35,
//         child: ListView.builder(
//       shrinkWrap: true,
//       physics: NeverScrollableScrollPhysics(),
//       scrollDirection: Axis.vertical,
//       itemBuilder: (context, index) {
//         JenisProduk jenisProduk = dataIndex[index];
//         return Card(
//           // child: Column(
//           //   mainAxisAlignment: MainAxisAlignment.start,
//           child: InkWell(
//             onTap: () {
//               if (idcustomer == "0") {
//                 Scaffold.of(context).showSnackBar(SnackBar(
//                   content: Text(
//                       'Anda Harus Melengkapi profile untuk melakukan transaksi!'),
//                   duration: Duration(seconds: 10),
//                 ));
// //                        Navigator.pop(context, false);
//               } else {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) {
//                   return FormInputOrder(
//                     jenisProduk: jenisProduk,
//                   );
//                 }));
//               }
//             },
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 SizedBox(
//                   height: 15,
//                 ),
//                 Row(
//                   children: <Widget>[
//                     IconButton(
//                       icon: Icon(
//                         Icons.favorite,
//                         color: index % 3 == 0
//                             ? Colors.grey[400]
//                             : Colors.redAccent,
//                       ),
//                       onPressed: () {},
//                     ),
//                     SizedBox(
//                       width: 14,
//                     ),
//                     Expanded(
//                         child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Text(
//                           jenisProduk.kapasitas,
//                           style: TextStyle(
//                               fontSize: 22,
//                               color: Colors.grey[800],
//                               fontWeight: FontWeight.bold),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         Text(
//                           jenisProduk.nama_kota,
//                           style: TextStyle(
//                             fontSize: 16,
//                             color: Colors.grey[500],
//                           ),
//                         ),
//                         SizedBox(
//                           height: 8,
//                         ),
//                         new Text(
//                           jenisProduk.harga.toString(),
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.green,
//                               fontWeight: FontWeight.bold),
//                           overflow: TextOverflow.fade,
//                         ),
//                       ],
//                     )),
//                     IconButton(
//                       icon: Icon(Icons.navigation),
//                       onPressed: () {},
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 16, right: 16),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.remove_red_eye,
//                             size: 12,
//                             color: Colors.grey[600],
//                           ),
//                           SizedBox(
//                             width: 4,
//                           ),
//                           Text("5 Viewer",
//                               style: TextStyle(
//                                   color: Colors.grey[600], fontSize: 12),
//                               overflow: TextOverflow.fade)
//                         ],
//                       ),
//                       Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.widgets,
//                             size: 12,
//                             color: Colors.grey[600],
//                           ),
//                           SizedBox(
//                             width: 4,
//                           ),
//                           Text(
//                             "2 Tersedia",
//                             style: TextStyle(
//                                 color: Colors.grey[600], fontSize: 12),
//                           )
//                         ],
//                       ),
//                       Row(
//                         children: <Widget>[
//                           Icon(
//                             Icons.local_grocery_store,
//                             size: 12,
//                             color: Colors.grey[600],
//                           ),
//                           SizedBox(
//                             width: 4,
//                           ),
//                           Text("Disewa 3 Kali",
//                               style: TextStyle(
//                                   color: Colors.grey[600], fontSize: 12),
//                               overflow: TextOverflow.fade)
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 16,
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       itemCount: 3,
// //      itemCount: dataIndex.length,
//     ));
//   }

  showAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Sesi Anda Berakhir!"),
      content: Text(
          "Harap masukkan kembali email beserta nomor handphone untuk mengakses fitur di aplikasi ini."),
      actions: [
        okButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  AccountValidation(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Lengkapi Profile anda"),
      content: Text("Anda harus melengkapi akun sebelum melakukan transaksi!"),
      actions: [
        okButton,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
