class ApiRoutes {
  //base route
  static const String base = 'https://stormy-falls-69167.herokuapp.com/api';

  //AUthentication
  static const String signUp = '$base/signup';
  static const String login = '$base/login';


  // get user profile
  static const String userProfile = '$base/user';

  // add data  
  static const String addTeacher = '$base/teacher';
  static const String addStudent = '$base/student';

  


  // request
  static const String donateRequest = '$base/requests';
  //create request
  static const String createRequest = '$base/requests/create';
  //make donation 
  static const String makeDonation = '$base/requests/create';
  // view donation
  static const String viewDonations = '$base/pastdonations';



}
