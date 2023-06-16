CREATE DATABASE QuanLyNongSan
GO
USE QuanLyNongSan

-- TẠO BẢNG
create table admin (
	id int IDENTITY(1,1) PRIMARY KEY,
	username nvarchar(50) UNIQUE not null,
	password nvarchar(50) not null,
	name nvarchar(50) not null
)

insert into admin values ('admin', '123456', N'Ngọc Thắng')

create table users (
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50) not null,
	email nvarchar(50) UNIQUE not null,
	phone nvarchar(20) not null,
	username nvarchar(50) UNIQUE not null,
	password nvarchar(50) not null,
	created date null
)

create table category
(
	id int IDENTITY(1,1) PRIMARY KEY,
	name nvarchar(50) not null,
	parent_id int null
)

Create table product (
	id int IDENTITY(1,1) PRIMARY KEY,
	category_id int not null foreign key references category(id) on delete cascade,
	name nvarchar(50) not null,
	price nvarchar(20) not null,
	status int not null,
	description nvarchar(4000) not null,
	content nvarchar(4000) not null,
	discount int,
	image_link nvarchar(4000) not null,
	created date null,  
)


create table orderitem
(
	id int IDENTITY(1,1) primary key,
	user_session nvarchar(50) not null,
	user_name nvarchar(50) not null,
	user_mail nvarchar(50) not null,
	user_phone nvarchar(20) not null,
	address nvarchar(300) not null,
	message nvarchar(4000) not null,
	amount nvarchar(20) not null,
	payment nvarchar(30) not null,
	status nvarchar(30),
	created date null
);

create table ordered
(
	id int IDENTITY(1,1) primary key,
	product_id int not null foreign key references product(id) on delete cascade,
	orderitem_id int not null foreign key references orderitem(id) on delete cascade,
	qty int not null,	
);


INSERT INTO category(name,parent_id) 
	VALUES (N'Rau củ quả',null);
INSERT INTO category(name,parent_id) 
	VALUES (N'Các Loại Hạt',null);
INSERT INTO category(name,parent_id) 
	VALUES (N'Trái Cây',null);


insert into product values (1,N'Rau Cải','15.000','1',N'Đây là rau sạch',N'Rau cải là loại rau không mấy xa lạ với người Việt ta. Bởi nó được dùng để chế biến thành các món ăn rất ngon và hợp khẩu vị. Nhưng nó ít được biết đến là vị thuốc chữa được rất nhiều loại bệnh. Ngoài cái tên cải bó xôi, nó còn có nhiều tên khác như: rau chân vịt, rau bắp xôi, rau nhà chùa, cải bina… Đây là loài cây thuộc họ nhà Dền và có xuất xứ từ miền Trung và Tây Nam Á.',0,'rau_cai.jpg','2022-1-22')
insert into product values (1,N'Rau Muống','14.000','1',N'Đây là rau sạch',N'Rau muống là loại rau có giá rất rẻ so với các loại rau khác nhưng lại đem lại lượng khoáng chất và vitamin dồi dào như protein, sắt, canxin, chất xơ, vitamin A... Những chất này là những dưỡng chất cần thiết cho cơ thể.',10,'rau_muong.jpg','2020-05-22')
insert into product values (1,N'Đậu Nhật','50.000','1',N'Đậu Nhật',N'Ðậu nành Nhật hay còn gọi là Đậu nành rau hay Đậu nành lông có nguồn gốc từ Nhật Bản, rất ngon và có giá trị dinh dưỡng cao, là loại thực phẩm rất tốt cho sức khỏe và bổ dưỡng vì hàm lượng của nó giàu chất khoáng, vitamin, protein, chất béo, chất xơ, rất tốt cho đường ruột, làm mịn da mặt và còn có tác dụng ngăn ngừa một số bệnh về ung thư',0,'dau_nhat.jpg','2022-1-22')
insert into product values (1,N'Hành baro','45.000','1',N'Hành Baro',N'Hành Baro có tên gọi khác là tỏi tây. Đây là một trong những nguyên liệu không thể thiếu trong rất nhiều món ăn, tạo mùi vị hấp dẫn, khó quên. Không những thế, tỏi tây còn là nguồn dinh dưỡng dồi dào đối với cơ thể. Để có thêm nhiều kiến thức về Hành Baro đừng bỏ lỡ bài viết này nhé.',10,'hanh_baro.jpg','2020-05-22')
insert into product values (1,N'Rau Cần Tây','55.000','1',N'Rau Cần Tây',N'Rau cần tây là một trong những loại rau được đánh giá là “ siêu thực phẩm” chứa hàm lượng dinh dưỡng cao, và ăn cực kỳ ngon nhất là khi kết hợp mùi thơm đặc biệt của cần tây xào với thịt bò…Ngoài sử dụng ở dạng tươi sống khi chế biến món ăn thì bạn cũng có thể làm nước ép cần tây tác dụng giảm cân, thanh nhiệt giải độc cơ thể rất tốt.',10,'rau_can_tay.jpg','2022-1-22')
insert into product values (1,N'Rau mùi - Ngò','120.000','1',N'Rau mùi - Ngò',N'Rau mùi hay còn được gọi bằng các tên gọi khác như: rau ngò, ngò rí, mùi ta, ngổ, mùi tui, nguyên tuy, hồ tuy, hương tuy, ngổ thơm,....Rau mùi là một loại cây thân thảo, loại rau này có nguồn gốc từ các nước Tây Nam Á và Châu Phi. ',10,'rau_mui.jpg','2020-05-22')
insert into product values (1,N'Xà lách Mỹ - Cuộn Xanh','80.000','1',N'Xà lách',N'Xà lách Mỹ có nguồn gốc từ vùng nhiệt đới và đến ngày nay nó đã  trở thành cây của toàn thế giới. Ở nước ta, Rau xà lách ưa khí hậu mát, đặc biệt là khí hậu ở Đà Lạt ',10,'xa_lach.jpg','2020-05-22')
insert into product values (1,N'Súp Lơ Tím','100.000','1',N'Súp Lơ',N'Súp lơ tím có tên gọi khác là bông cải tím. Đây là một trong những loại rau trồng được các bà nội trợ ưa chuộng với giá trị dinh dưỡng cao. Đó cũng là lý do giá súp lơ tím cao hơn so với các loại rau thông thường.',10,'sup_lo.jpg','2020-05-22')
insert into product values (2,N'Hạt Sen','75.000','1',N'Hạt Sen',N'Hạt sen sấy là một loại hạt dinh dưỡng, mang lại rất nhiều lợi ích đối với sức khỏe người sử dụng. Từ xưa, cây sen đã là một loài cây trồng quen thuộc và là biểu tượng của người dân Việt Nam. Hạt sen sấy là sản phẩm của hạt sen tươi khi đã chín được người nông dân thu về và chế biến, bảo quản. Hạt sen sấy giòn (hạt sen sấy khô) sẽ bảo quản được thời gian lâu hơn so với hạt sen tươi. Hạt sen sấy có rất nhiều công dụng khác nhau. Ngoài sử dụng như một vị thuốc không thể thiếu trong Đông Y, sen sấy khô còn là nguyên liệu để chế biến rất nhiều món ăn thơm ngon, bổ dưỡng chẳng hạn như: chè hạt sen long nhãn, chè hạt sen nấm tuyết, cháo hạt sen, hạt sen sấy giòn…',5,'hat_sen.jpg','2017-1-1')
insert into product values (2,N'Hạt Ươi','45.000','1',N'Hạt Ươi',N'Hạt Ươi (Sterculia lychonophora Hnce) còn có tên gọi khác là hạt ươi bay, hạt đười ươi, an nam tứ, đại đồng quả, pang da hai,...Đây là một trong những loại hạt được pha làm nước uống bổ dưỡng vào mùa hè, xua tan đi cái nóng và mệt mỏi. Vòng tuần hoàn ra quả của cây ươi đó là 4 năm một lần. Cây ươi sinh trường, phát triển ở trong rừng thường có mặt ở các nước thuộc khu vực Đông Nam Á như: Thái Lan, Việt Nam, Lào hay Malaysia. Tại Việt Nam, cây ươi mọc ở Tây Nguyên và vùng Trung Trung Bộ. Hạt ươi rừng sau khi thu hoạch sẽ được sàng lọc thêm một lần nữa để chọn ra những hạt chất lượng nhất. Sau đó sơ chế để bán lẻ và xuất khẩu đi một số nước. ',0,'hat_uoi.jpg','2022-1-22')
insert into product values (2,N'Hạt Phỉ','250.000','1',N'Hạt Phỉ',N'Hạt phỉ còn có tên gọi khác là Hazelnut, tên thực vật của nó là Corylus avellana. Hạt phỉ được trồng nhiều ở nhiều quốc gia như: Hy Lạp, Georgia, Thổ Nhĩ Kì, Italia, Anh, phía nam Tây Ban Nha và 2 bang Oregon  và Washington  của Mỹ. Thổ Nhĩ Kì là nơi cung cấp nguồn hạt phỉ lớn nhất trên thế giới, chiếm tới 75% sản lượng toàn thế giới. Hạt phỉ ngon, nhiều chất dinh dưỡng rất tốt cho sức khỏe. Không chỉ thế, mùi vị của hạt phỉ thơm ngon, bùi béo nên nó thường được dùng để nấu ăn, trong các món bánh.',20,'hat_phi.jpg','2022-1-22')
insert into product values (2,N'Quả Hạch','300.000','1',N'Quả Hạch',N'Quả hạch khô còn có tên gọi khác là hạt bào ngư, hạt móng ngựa, hình dáng của quả hạch bên ngoài xù xì, có lớp vỏ cứng màu nâu sẫm. Quả hạch có phần nhân bên trong màu trắng, nhận được bao bọc 1 lớp màn mỏng nâu. Phần nhân béo gùi, ăn rất thơm. Quả hạch được chọn to đèu, không bị dập nát, bị thối, sau đó mang đi sấy khô với công nghệ hiện đại. Quả hạch sẽ được tách lớp vỏ cứng bên ngoài rồi  mới đóng gói trong các bao bì an toàn, hợp vệ sinh. Hạt quả hạch đóng gói tiện lợi, dễ sử dụng, bạn chỉ cần bảo quản ở nơi thoáng mát, khô ráo và dùng mỗi ngày, không nhất thiết phải để trong tủ lạnh.',0,'hach_kho.jpg','2022-1-22')
insert into product values (2,N'Ô Mai Khô ','200.000','1',N'Ô Mai',N'Ô Mai còn có tên gọi khác là mơ đen, từ xưa ô mai là tên một vị thuốc làm từ quả mơ phơi khô cho đên khi đen và quắt lại. Trong y học cổ truyền, ô mai là vị thuộc rất phổ biến ở các nước châu á như Việt Nam, Trung Quốc. Ngày nay thì ô mai thường được dùng như một loại đồ ăn vặt được làm từ các loại quả khác nhau như: mận, me, sấu mơ, sử dụng ăn vặt nhiều hơn là làm thuốc. Những loại quả để làm mở cần phải được chọn lựa kỹ càng và chế biến với nhiều hương liệu, nguyên liệu khác nhau thì mới làm ra được món ô mai ngon nhất.',20,'o_mai.jpg','2022-1-22')
insert into product values (2,N'Sa Nhân','450.000','1',N'Sa Nhân',N'Sa Nhân còn có tên gọi khác trong tiếng Tày là mác nẻng, trong tiếng là co nénh, sa nhân là loại cây mọc hoang rất nhiều ở các vùng rừng núi, dưới tán cây sa nhân râm mát. Bọ phận thường dùng làm thuốc của sa nhân là hạt quả. Quả thường được hát vào mùa hè, bóc vỏ rồi lấy hạt ở phía trong, sây khô sử dụng dần.',20,'sa_nhan.jpg','2020-05-22')
insert into product values (2,N'Thảo Quả','125.000','1',N'Thảo Quả',N'Tên tiếng Việt khác: Thảo quả đỏ / Thảo quả đen Tên danh pháp hai phần: Amomum tsao-ko Thuộc họ: Gừng(Zingiberaceae) Hoa thảo quả thường nở vào mùa hè ( khoảng từ tháng 5 đến tháng 7) và ra quả vào mùa đông Ở Việt Nam, thảo quả mọc chủ yếu ở vùng Tây Bắc và dãy núi Hoàng Liên Sơn, nó mọc nhiều nhất ở các tỉnh Lào Cai, Yên Bái, Hà Giang, Lai Châu Thảo quả là một loại cây thảo mộc có vị cay nóng, mùi thơm đặc trưng, chúng thường được sử dụng trong ẩm thực và làm thuốc chữa bệnh. Nó còn được mệnh danh là “nữ hoàng gia vị” trong chế biến các món ăn ngon và nổi tiếng của Việt Nam.',0,'thao_qua.jpg','2022-1-22')
insert into product values (2,N'Hạt Điều','150.000','1',N'Hạt Điều',N'Điều hay còn gọi là đào lộn hột, là một cây công nghiệp thuộc họ xoài. Nó được trồng ở khí hậu nhiệt đới để lấy nhân hạt chế biến làm thực phẩm.Hạt điều ăn rất giòn và có hương thơm đặc trưng. Thường mọi người hay tìm mua hạt điều rang muối. Đây là đặc sản của Việt Nam nên thị trường hạt điều xuất khẩu luôn dẫn đầu cao.',10,'hat_dieu.jpg','2020-05-22')
insert into product values (3,N'Xoài Tượng Bình Định','35.000','1',N'Xoài Tượng Bình Định ',N'Ở Bình Định nổi tiếng với nhiều loại xoài như: Xoài tượng, xoài thanh ca, xoài mật, xoài tro, xoài xẻ...vv. Mỗi loại xoài đều có những hương vị độc đáo riêng. Trong đó ngon nhất và ấn tượng nhất thì phải kể đến xoài tượng. Ngoài vị thơm, ngọt thì xoài tượng có cho giá trị kinh tế cao nhất và được thị trường rất ưa chuộng. Xoài Tượng được trồng ở rất nhiều nơi nhưng nhắc đến xoài tượng là người ta nghĩ ngay đến Đại An (Bình Định) vì nơi đây trồng xoài tượng nhiều nhất và ngon nhất hiện nay.',10,'xoai_tuong.jpg','2022-1-22')
insert into product values (3,N'Vú Sữa Lò Rèn','50.000','1',N'Vũ Sữa Lò Rèn',N'Vú sữa Lò rèn Vĩnh Kim là một loại trái cây ngon mọi người dân Nam Bộ và quốc gia đều biết đến và hiện nay được trồng ở quy mô công nghiệp, nhưng giống vú sữa Lò rèn Vĩnh Kim gắn với vùng đất đặc biệt này vẫn được người dân gìn giữ, đặc biệt cây vú sữa Lò rèn Vĩnh Kim được trồng từ hạt của cây vú sữa đầu tiên. Thịt quả có màu trắng đục, mềm, nước dạng sữa, dày thịt, tỷ lệ thịt quả cao, ít hạt, có mùi vị rất ngọt, béo, mùi thơm dịu đặc trưng. ngon. Vú sữa lò rèn vĩnh kim có vị ngọt, được ăn tươi hoặc làm lạnh. Đây là loại quả được người Việt Nam ưa chuộng và sử dụng từ hàng trăm năm trước.',0,'vu_sua.jpg','2022-1-22')
insert into product values (3,N'Hồng Xiêm','25.000','1',N'Hồng Xiêm',N'Quả Hồng Xiêm là tên gọi ở miền Bắc, bà con miền Nam gọi là trái sapoche, đây là loại quả quí, lành tính dùng được cho người khỏe mạnh và cả người ốm. Để chất lượng quả thơm, ngọt lúc chín như ý cần lấy được quả già và biết cách dấm vừa độ chín.',10,'hong_xiem.jpg','2020-05-22')
insert into product values (3,N'Nhãn Lồng Hưng Yên ','40.000','1',N'Nhãn Lồng Hưng Yên',N'Nhãn có tên khoa học là Dimocarpus longan, tiếng hán việt gọi là “long nhãn”. Đây là một loại trái cây điển hình của vùng nhiệt đới thuộc thân gỗ, sống lâu năm. Theo tổng hợp từ các địa phương, hiện nay Hưng Yên là nơi có diện tích trồng lớn nhất và cho chất lượng nhãn ngon nhất, hiện nay Hưng Yên có gần 4 nghìn ha nhãn, trong đó, diện tích cho thu hoạch khoảng 3 nghìn ha.',15,'nhan_long.jpg','2022-1-22')
insert into product values (3,N'Quả Thanh Mai','90.000','1',N'Quả Thanh Mai',N'Quả thanh mai có cân bằng axit - đường tốt và là nguồn cung cấp thiamine, riboflavin, carotene, khoáng chất, chất xơ và hàm lượng vitamin rất cao. Chúng cũng là một nguồn tốt cung cấp chất chống oxy hóa tương tự (ví dụ anthocyanin) có màu đỏ rượu vang lợi ích sức khỏe. Ngoài anthocyanin, bayberry còn chứa flavonol, ellagitannin và các hợp chất phenolic như axit gallic, quercetin hexoside,...',0,'thanh_mai.jpg','2022-1-22')
insert into product values (3,N'Cam Sành','25.000','1',N'Cam Sành',N'Cam sành là một giống cây ăn quả thuộc chi Cam chanh phân bố rộng khắp Việt Nam từ Tuyên Quang, Hà Giang, Yên Bái tới Vĩnh Long, Tiền Giang, Cần Thơ. Nhưng nhìn chung cam sành thích hợp với vùng đất phù sa cổ màu mỡ,khí hậu mát ẩm. Cam sành vietgap đang là tiêu chuẩn trồng và chăm sóc chính của bà con nơi đây',5,'cam_sanh.jpg','2022-1-22')
insert into product values (3,N'Na Lạng Sơn ','30.000','1',N'Na Lạng Sơn',N'Na, hay còn gọi là mãng cầu ta, mãng cầu dai/giai, sa lê, phan lệ chi, là một loài thuộc chi Na (Annona) có nguồn gốc ở vùng châu Mỹ nhiệt đới. Quả na là một trong những trái cây nhiệt đới ngon nhất có nguồn gốc từ các thung lũng Andean của Peru và Ecuador. Ngày nay, loại quả vừa ngon vừa tốt cho sức khỏe này đã được trồng phổ biến ở khắp thể giới.',5,'na.jpg','2022-1-22')
insert into product values (3,N'Thanh Long','35.000','1',N'Thanh Long',N'Thanh long ruột trắng thuộc chi Hylocereus tên khoa học là Hylocereus undatus. Vỏ quả có màu hồng hoặc đỏ. Người ta gọi là thanh long ruột trắng vì ở Phan Thiết- Bình Thuận có còn một loại thanh long nữa là thanh long ruột đỏ',5,'thanh_long.jpg','2022-1-22')



