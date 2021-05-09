
🍎flutter android up down game🍎
- file
loading  게임을 시작할수 있는화면   
chat => 채팅 UI / TEXTFILDE UI   
chatmessage => 채팅 message UI   
numbercontroller => MIN MAX값 controller   

- 게임 설명!
게임시작 버튼을 누르면 채팅화면으로 넘어감   
채팅화면으로 넘어갈 시 랜덤으로 값을 생성하고 , 사용자가 값이 무엇인지 맞추는 게임   
사용자가 값을 입력하고 그값이 결과값보다 작으면 UP 크면 DOWN!   
사용자가 값을 맞출 시 채팅방을 나가고 MIN MAX 값 초기화!   

- 특징
getx를 사용하여 최댓값 최솟값 관리! / getx router 사용!   
채팅은 listview로 구현! reverse true로 줘서 하단부터 올라가게함   
채팅메세지를 class로 구현하여 채팅을 할 때마다 list에 담김!   
list에 담겨있는것을 listview itembuilder 에서 출력해줌   


