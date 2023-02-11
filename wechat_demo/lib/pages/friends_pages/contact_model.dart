class ContactModel {
  final String? imageUrl; //联系人头像
  final String? name; //item名称 or 联系人昵称
  final String? imageAssets; //本地图片
  final String? indexLetter; //索引字母
  final String? groupTitle; //分组标题

  ContactModel({
    this.imageUrl,
    this.name,
    this.imageAssets,
    this.indexLetter,
    this.groupTitle,
  });
}

//索引数据
const List indexWordsData = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

//朋友信息模拟
List<ContactModel> simulateNetData = [
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/27.jpg',
      name: 'Lina',
      indexLetter: 'L'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/17.jpg',
      name: '菲儿',
      indexLetter: 'F'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/16.jpg',
      name: '安莉',
      indexLetter: 'A'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/men/31.jpg',
      name: '阿贵',
      indexLetter: 'A'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/22.jpg',
      name: '贝拉',
      indexLetter: 'B'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/37.jpg',
      name: 'Lina',
      indexLetter: 'L'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/18.jpg',
      name: 'Nancy',
      indexLetter: 'N'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/men/47.jpg',
      name: '扣扣',
      indexLetter: 'K'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/men/3.jpg',
      name: 'Jack',
      indexLetter: 'J'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/5.jpg',
      name: 'Emma',
      indexLetter: 'E'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/24.jpg',
      name: 'Abby',
      indexLetter: 'A'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/men/15.jpg',
      name: 'Betty',
      indexLetter: 'B'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/men/13.jpg',
      name: 'Tony',
      indexLetter: 'T'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/men/26.jpg',
      name: 'Jerry',
      indexLetter: 'J'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/men/36.jpg',
      name: 'Colin',
      indexLetter: 'C'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/12.jpg',
      name: 'Haha',
      indexLetter: 'H'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/11.jpg',
      name: 'Ketty',
      indexLetter: 'K'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/13.jpg',
      name: 'Lina',
      indexLetter: 'L'),
  ContactModel(
      imageUrl: 'https://randomuser.me/api/portraits/women/23.jpg',
      name: 'Lina',
      indexLetter: 'L'),
];
