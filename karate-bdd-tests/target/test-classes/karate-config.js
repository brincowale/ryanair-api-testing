function fn() {
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    karate.configure('proxy', 'http://localhost:8888');
    karate.configure('ssl', true);

    var config = {};
    var result = karate.callSingle('get_all_users.feature', config);
    config = { user_list: result.user_list };
    return config
}