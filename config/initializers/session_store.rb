SampleApp::Application.config.session_store :redis_store, {
	servers: [
		{
			host: "localhost",	#Redisのサーバー名
			post: 6379,			#Redisのサーバーのポート
			deb: 0,				#データベースの番号(0~15)の任意
			hamespace: "session" # 名前空間。"session:セッションID"の形式
		},
	],
	expire_after: 90.minutes #保存期間
}