-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 02, 2023 lúc 03:16 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `nodejs`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `books`
--

CREATE TABLE `books` (
  `bookId` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publishing` int(15) NOT NULL DEFAULT 2023,
  `stars` float DEFAULT 5,
  `ratings` int(15) NOT NULL DEFAULT 1,
  `description` varchar(2550) NOT NULL,
  `category` varchar(255) NOT NULL,
  `commentCount` int(11) DEFAULT 0,
  `views` int(15) NOT NULL DEFAULT 0,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `books`
--

INSERT INTO `books` (`bookId`, `title`, `image`, `author`, `publishing`, `stars`, `ratings`, `description`, `category`, `commentCount`, `views`, `createdAt`, `updatedAt`) VALUES
(4, 'Hai số phận', '2s.jpg', 'Jeffrey Archer', 1979, 5, 1, 'Cuốn sách là một câu chuyện kể về hai người có số phận khác nhau. Họ không có điểm gì giống nhau cả ngoại trừ việc họ sinh ra vào cùng một thời điểm (18/04/1906) và có một lòng quyết tâm để đạt được thành công trong cuộc sống. William Lowell Kane là một người mạnh mẽ và giàu có trong khi đó Abel Rosnovski (tên ban đầu là Wladek Koskiewicz) là một người gốc Ba Lan phải đấu tranh từ lúc sinh ra và lớn lên cùng với những người nghèo khổ, cuối cùng di cư đến Hoa Kỳ.', 'Tiểu thuyết', 6, 0, '2023-04-15 12:31:39', '2023-04-19 04:24:17'),
(6, 'Chúa tể những chiếc nhẫn', 'Q65JIR35.jpg', 'J. R. R. Tolkien', 1955, 3, 2, 'Chúa tể những chiếc nhẫn - The Lord of the Rings thực sự là tập hợp quy mô những hiểu biết về một thế giới tưởng tượng có tên là Middle Earth (hay vùng Trung Địa) với nhiều giống loài khác nhau như The Man (người thường), Hobbit (bán nhân), Dwarf (người lùn râu dài), Elf (tiên tộc), Ent (mộc tinh), Goblin (yêu tinh), Orc (người orc), Uruk-hai (giống orc mới), Warg (ma sói), Great Eagle (Đại bàng lớn)...', 'Tiểu thuyết phiêu lưu, Anh hùng lãng mạn,kỳ ảo', 3, 0, '2023-04-15 12:31:39', '2023-04-19 04:19:09'),
(8, 'Cuộc Đời Của Pi', 'Cuoc_doi_cua_Pi.jpg', 'Yann Martel', 2001, 4.5, 4, 'Tác phẩm kể về cậu bé Piscine Molitor Patel, sau đó, cậu tự gọi mình là Pi. Pi là con trai của một chủ vườn thú tại vùng Pondicherry của Ấn Độ. Cậu say mê tôn giáo và cùng một lúc theo cả đạo Hindu, đạo Hồi và đạo Thiên Chúa. Để tránh những biến cố chính trị, gia đình cậu chuyển toàn bộ vườn thú tới Canada trên một con tàu của Nhật Bản có tên là Tsimtsum. Con tàu đã gặp một cơn bão lớn và chìm, còn Pi lạc mất gia đình mình, cậu sống sót trên chiếc thuyền cứu hộ cùng một con hổ Bengal có tên Richard Parker, một con linh cẩu, một con đười ươi và một con ngựa vằn. Cuối cùng, chỉ còn lại con hổ và cậu lênh đênh trên biển. Sử dụng những hiểu biết về nuôi dưỡng thú hoang, Pi đã duy trì sự sống của cả cậu và Richard Parker cho tới khi cả hai dạt lên một bờ biển. Câu chuyện bắt đầu khi tác giả gặp Pi, lúc này đã ở tuổi trung niên có vợ và hai con, tại Winnipeg - Canada và bắt đầu ghi chép lại chuyện đời của anh.', 'Tiểu thuyết', 5, 0, '2023-04-15 12:31:39', '2023-04-23 12:57:34'),
(10, 'Speak', '12703531-L.jpg', 'Laurie Halse Anderson', 2000, 3, 1, 'A traumatic event near the end of the summer has a devastating effect on Melinda\'s freshman year in high school.', 'Children\'s fiction, Interpersonal relations, fiction, Schools, fiction, Rape, fiction, Mental health', 0, 0, '2023-04-15 12:31:39', '2023-04-19 07:04:44'),
(12, 'I Have to Tell You Something', '13945571-L.jpg', 'Zara Bas', 2022, 4, 0, 'This edition doesn\'t have a description yet.', 'How-to', 1, 0, '2023-04-15 12:31:39', '2023-04-18 11:43:25'),
(14, 'The Cruel Prince', 'book.jpg', 'Holly Black', 2022, 5, 2, 'Of course I want to be like them. They’re beautiful as blades forged in some divine fire. They will live forever.\r\n\r\nAnd Cardan is even more beautiful than the rest. I hate him more than all the others. I hate him so much that sometimes when I look at him', 'Fairies, fiction, Fiction, romance, paranormal, general, Young Adult Fiction, Romance, Fiction, fantasy', 1, 0, '2023-04-15 12:31:39', '2023-04-19 03:16:36'),
(15, 'Tội Ác Và Hình Phạt', 'UH8ZDY1I.jpg', 'Fyodor Dostoevsky', 1866, 4, 1, 'Tác phẩm tập trung vào nhân vật trung tâm Rodion Romanovich Raskolnikov, một sinh viên trường luật ở Saint Petersburg. Raskolnikov xuất thân từ một gia đình nghèo ở nông thôn, người mẹ không đủ điều kiện nuôi anh ăn học đến ngày thành đạt, cô em gái Dunhia giàu lòng hy sinh phải làm gia sư cho gia đình lão địa chủ quý tộc dâm dục Arkady Ivanovich Svidrigailov để nuôi anh. Nhưng vốn là một cô gái thông minh, giàu tự trọng, Dunhia bỏ việc dạy học vì bị lão địa chủ Svidrigailov ve vãn hòng chiếm đoạt, mặc dù lão đã có vợ con. Đời sống gia đình ngày càng khó khăn khiến Raskolnikov phải bỏ học giữa chừng. Trong hoàn cảnh khó khăn như vậy, một người mối lái đưa Pyotr Petrovich Luzhin (Luzhin), một viên quan cao cấp ngành Toà án ở Thủ đô đến gặp Dunhia hỏi vợ.', '1866', 3, 0, '2023-04-16 08:59:39', '2023-04-19 04:45:58'),
(16, 'The Line of Beaty', '844194-L.jpg', ' Alan Hollinghurst', 2004, 4, 1, 'It is the summer of 1983, and twenty-year-old Nick Guest has moved into an attic room in the Notting Hill home of the Feddens: conservative Member of Parliament Gerald, his wealthy wife Rachel, and their two children, Toby--whom Nick had idolized at Oxford--and Catherine, highly critical of her family\'s assumptions and ambitions, who becomes both a friend to Nick and his uneasy responsibility.\r\n\r\nAs the boom years of the mid-eighties unfold, Nick, an innocent in matters of politics and money, becomes caught up in the Feddens\' world--its grand parties, its surprising alliances, its parade of monsters both comic and menacing. In an era of endless possibility, he finds himself able to pursue his own private obsession with beauty--a prize as compelling to him as power and riches to his friends. An affair with a young black clerk gives him his first experience of romance, but it is a later affair with a beautiful millionaire that will change his life drastically and bring into question the larger fantasies of a ruthless decade.', 'coming of age, domestic fiction, psychological fiction, fiction', 0, 0, '2023-04-16 09:48:11', '2023-04-19 04:35:16'),
(17, 'Chiến Tranh Và Hòa Bình', 'tolstoy-war-and-peace-bookcover.jpg', 'Leo Tolstoy', 1869, 4.33333, 3, 'Tiểu thuyết Chiến tranh và hòa bình được Lev Tolstoy khởi thảo vào năm 1863 và gửi in tại nhà Russki Vestnik từ năm 1865 đến năm 1869 thì hoàn thành, không kể nhiều năm tiếp theo liên tục được chính tác giả sửa chữa trong các lần tái bản. Người ta thống kê được chừng 10.000 bản nháp mà Lev Tolstoy dùng để sửa chữa tác phẩm của mình. Nhan đề của nguyên tác là Война и Мiръ, trong đó, Мiръ của văn phạm Nga thế kỷ XIX có nghĩa là dân sự; sang đến thập niên 1930 khi chính quyền Soviet quyết định ấn hành tất cả trứ tác của Lev Tolstoy, nhan đề và nội dung đã được sửa lại theo văn phạm cách tân. Những bản in hiện đại bị nhiều học giả chỉ trích là không thể truyền tải nguyên vẹn ý tưởng của tác giả[4]. Chiến tranh và hòa bình được liệt vào hạng danh tác trong các ấn phẩm thuộc trào lưu lãng mạn Nga thế kỷ XIX.', 'Tiểu thuyết lãng mạn', 3, 0, '2023-04-16 09:57:19', '2023-04-19 07:21:59'),
(18, 'Đắc Nhân Tâm', 'dac-nhan-tam-biamem2019-76k-bia1-430x616.webp', 'Dale Carnegie', 1936, 4.6, 5, 'Đắc nhân tâm (Được lòng người), tên tiếng Anh là How to Win Friends and Influence People là một quyển sách nhằm tự giúp bản thân (self-help) bán chạy nhất từ trước đến nay. Quyển sách này do Dale Carnegie viết và đã được xuất bản lần đầu vào năm 1936, nó đã được bán 15 triệu bản trên khắp thế giới.[1][2] Nó cũng là quyển sách bán chạy nhất của New York Times trong 10 năm. Tác phẩm được đánh giá là cuốn sách đầu tiên và hay nhất trong thể loại này, có ảnh hưởng thay đổi cuộc đời đối với hàng triệu người trên thế giới.', 'Tự giúp bản thân', 7, 0, '2023-04-16 09:59:20', '2023-04-19 10:27:37'),
(19, 'Thinking, fast and slow', '7889800-L.jpg', 'Daniel Kahneman', 2011, 3.66667, 3, 'The book delineates rational and non-rational motivations or triggers associated with each type of thinking process, and how they complement each other, starting with Kahneman\'s own research on loss aversion. From framing choices to people\'s tendency to replace a difficult question with one which is easy to answer, the book summarizes several decades of research to suggest that people have too much confidence in human judgement.[1] Kahneman performed his own research, often in collaboration with Amos Tversky, which enriched his experience to write the book.[2][3] It covers different phases of his career: his early work concerning cognitive biases, his work on prospect theory and happiness, and with the Israel Defense Forces.', 'Tâm lý', 0, 0, '2023-04-16 09:59:38', '2023-04-19 07:22:58'),
(20, 'Không Gia Đình', 'KhÃ´ng_gia_ÄÃ¬nh_1_(sÃ¡ch).jpg', 'Hector Malot', 1878, 4, 1, 'Không gia đình kể chuyện một cậu bé tên là Rémi bị bỏ rơi từ nhỏ rồi bị bỏ lại ở 1 góc đường,cậu được 1 gia đình khác nhận nuôi. Rémi được chăm sóc trong vòng tay yêu thương của má Barberin. Cho đến một ngày người chồng của má làm việc ở Paris bị tai nạn và tàn phế trở về, sau đó Rémi đi theo gánh xiếc của cụ Vitalis để làm thuê. Hai người đã đi lang thang khắp mọi miền nước Anh và Pháp trình diễn xiếc để kiếm sống, sau đó bị tù ở Anh,[1] cuối cùng tìm thấy mẹ và em.[2] Em bé Rémi ấy đã lớn lên trong gian khổ. Em đã chung đụng với mọi hạng người, sống khắp mọi nơi, \"Nơi thì lừa đảo, nơi thì xót thương\". Em đã lao động lấy mà sống, lúc đầu dưới quyền điều khiển của một ông già từng trải và đạo đức, cụ Vitalis, về sau thì tự lập và không những lo cho mình, còn bảo đảm việc biểu diễn và sinh sống cho cả một gánh hát rong. Đã có khi em và cả đoàn lang thang suốt mấy ngày không có chút gì trong bụng.[3] Đã có khi em mắc oan, bị giải ra trước toà án và bị ở tù. Và cũng có khi em được nuôi nấng đàng hoàng, no ấm. Nhưng dù ở đâu, trong cảnh ngộ nào, em vẫn noi theo nếp rèn dạy của ông già Vitalis giữ phẩm chất làm người, nghĩa là ngay thẳng, gan dạ, tự trọng, thương người, ham lao động, không ngửa tay xin xỏ, không dối trá, gian giảo, nhớ ơn nghĩa, luôn luôn muốn làm người có ích.', 'Tiểu thuyết', 0, 0, '2023-04-16 10:00:53', '2023-04-19 04:47:52'),
(22, 'A Court of Mist and Fury', '13325541-L.jpg', 'Sarah J. Maas', 2020, 4.5, 2, 'publishing mo ta', 'Fantasy, Fiction, Fairies, Blessing and cursing, Children\'s fiction, Fantasy fiction, Fairies', 8, 0, '2023-04-16 11:12:51', '2023-04-19 03:41:45'),
(23, 'Hoàng Tử Bé', 'htb.jpg', 'Antoine de Saint-Exupéry', 1943, 5, 1, 'Người kể chuyện bắt đầu câu chuyện bằng một cuộc thảo luận về bản chất của người lớn và về việc họ không thể nhận ra được “những điều quan trọng”. Để xác định xem một người lớn có sáng suốt như một đứa trẻ không, ông cho họ xem một bức tranh vẽ một con rắn nuốt một con voi. Người lớn luôn đưa ra câu trả lời rằng bức tranh vẽ một cái nón, và vì vậy ông biết rằng chỉ có thể nói với họ về những điều “hợp lý”, thay vì những điều huyền ảo viễn vông.', 'Tiểu thuyết', 1, 0, '2023-04-17 11:28:34', '2023-04-19 05:06:36'),
(24, 'Ông Già Và Biển Cả', 'Oldmansea.jpg', 'Ernest Hemingway', 1952, 4, 1, 'Câu chuyện xoay quanh cuộc sống đánh cá lênh đênh, gian nan của ông lão người Cuba, Santiago, người đã cố gắng chiến đấu trong ba ngày đêm với một con cá kiếm khổng lồ trên biển vùng Giếng Lớn khi ông câu được nó. Sang đến ngày thứ ba, ông dùng lao đâm chết được con cá, buộc nó vào mạn thuyền và mang về nhưng đàn cá mập lại đánh hơi thấy mùi của con cá mà ông bắt được nên đã ùa tới, ông cũng rất dũng cảm đem hết sức mình chống chọi với lũ cá mập, phóng lao và thậm chí dùng cả mái chèo để đánh. Cuối cùng ông giết được khá nhiều con và đuổi được chúng đi, nhưng cuối cùng khi ông về đến bờ và nhìn lại thì con cá kiếm của mình thì nó đã bị rỉa hết thịt và chỉ còn trơ lại một bộ xương trắng.', 'Bi kịch', 1, 0, '2023-04-19 03:26:13', '2023-04-19 03:59:39'),
(25, 'Nhà Giả Kim', 'NhÃ _giáº£_kim_(sÃ¡ch).jpg', 'Paulo Coelho', 2013, 5, 0, 'Nhân vật chính trong truyện là Santiago. Cha mẹ Santiago mong muốn cậu trở thành linh mục để mang lại niềm tự hào cho gia đình, nhưng vì ước mơ từ nhỏ của chính mình là đi đây đi đó khắp thế giới, Santigo đã thuyết phục được cha cậu và trở thành một người chăn cừu.\r\n\r\nDưới vai một người chăn cừu, cậu chu du khắp vùng quê Andaluisa, phía nam Tây Ban Nha, trong vài năm, tận hưởng một cuộc sống vô tư lự và phiêu lưu. Trên đường tới một thành phố nhỏ mà một năm trước cậu đã từng tới để bán lông cừu và gặp người con gái của ông chủ tiệm - cô gái mà cậu thầm mến, Santiago có một giấc mơ cậu không thực sự hiểu lặp lại hai lần. Nhớ ra ở Tarifa có một bà thầy bói đoán mộng, Santiago quyết định đi gặp bà lão. Cái già bà thầy bói đưa ra là một lời thề - rằng khi tìm được kho tàng ở Kim tự tháp Ai Cập, cậu phải chia một phần mười của nó cho bà. Thế nhưng, lời giải đáp cậu nhận được từ bà lại không khiến cậu thực sự tin tưởng và hài lòng: Hãy đi đến Kim tự tháp Ai Cập…', 'Phiêu lưu, tưởng tượng, thần bí', 0, 0, '2023-04-19 03:54:01', '2023-04-19 03:55:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
--

CREATE TABLE `comments` (
  `commentId` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `userUserId` int(10) UNSIGNED DEFAULT NULL,
  `bookBookId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `comments`
--

INSERT INTO `comments` (`commentId`, `content`, `createdAt`, `updatedAt`, `userUserId`, `bookBookId`) VALUES
(14, '2', '2023-04-16 03:09:28', '2023-04-16 03:09:28', 1, 4),
(15, 'fd', '2023-04-16 03:15:22', '2023-04-16 03:15:22', 1, 6),
(16, 'b13', '2023-04-16 03:15:33', '2023-04-16 03:15:33', 1, 6),
(17, 'b5', '2023-04-16 03:31:48', '2023-04-16 03:31:48', 1, 12),
(18, '22', '2023-04-16 05:36:01', '2023-04-16 05:36:01', 1, 4),
(19, 'aaaaaa', '2023-04-16 05:36:10', '2023-04-16 05:36:10', 1, 4),
(20, 'sssss', '2023-04-16 06:16:18', '2023-04-16 06:16:18', 1, 6),
(21, 'aaaaaaaaaa', '2023-04-16 06:16:27', '2023-04-16 06:16:27', 1, 8),
(22, 'sssssssssssssdsssssssssssssssssssssssssssssssssssssss\r\nasg\r\ns', '2023-04-16 06:16:52', '2023-04-16 06:16:52', 1, 4),
(23, 'adu dc lun kia', '2023-04-16 09:01:43', '2023-04-16 09:01:43', 1, 15),
(24, 'dinh', '2023-04-16 09:01:48', '2023-04-16 09:01:48', 1, 15),
(25, 'binh luan len xu huong 1', '2023-04-16 11:24:23', '2023-04-16 11:24:23', 1, 22),
(26, 'binh luan len xu huong 2', '2023-04-16 11:24:30', '2023-04-16 11:24:30', 1, 22),
(27, 'binh luan len xu huong 5', '2023-04-16 11:24:37', '2023-04-16 11:24:37', 1, 22),
(28, 'binh luan len xu huong 3', '2023-04-16 11:24:41', '2023-04-16 11:24:41', 1, 22),
(29, 'binh luan len xu huong 45', '2023-04-16 11:24:45', '2023-04-16 11:24:45', 1, 22),
(30, 'binh luan len xu huong 255', '2023-04-16 11:24:49', '2023-04-16 11:24:49', 1, 22),
(31, 'hehe', '2023-04-17 08:39:20', '2023-04-17 08:39:20', 1, 4),
(32, 'b luan', '2023-04-17 10:26:41', '2023-04-17 10:26:41', 1, 22),
(34, 'first book', '2023-04-17 11:30:39', '2023-04-17 11:30:39', 1, 14),
(35, 'ok', '2023-04-19 03:27:12', '2023-04-19 03:27:12', 1, 24),
(36, 'hi', '2023-04-19 03:41:45', '2023-04-19 03:41:45', 1, 22),
(37, 'binh luan len xu huong', '2023-04-19 04:40:32', '2023-04-19 04:40:32', 1, 18),
(38, 'bl', '2023-04-19 04:40:54', '2023-04-19 04:40:54', 1, 18),
(39, 'hay', '2023-04-19 04:41:12', '2023-04-19 04:41:12', 2, 18),
(40, 'hayy', '2023-04-19 04:41:18', '2023-04-19 04:41:18', 2, 18),
(41, 'ok', '2023-04-19 04:41:26', '2023-04-19 04:41:26', 2, 18),
(42, 'tuyet', '2023-04-19 04:41:41', '2023-04-19 04:41:41', 2, 18),
(43, 'hay qua', '2023-04-19 04:43:46', '2023-04-19 04:43:46', 2, 8),
(44, 'cute', '2023-04-19 04:44:02', '2023-04-19 04:44:02', 2, 8),
(45, 'ok', '2023-04-19 04:45:33', '2023-04-19 04:45:33', 2, 17),
(46, 'tttt', '2023-04-19 04:45:40', '2023-04-19 04:45:40', 2, 17),
(47, 'hay', '2023-04-19 04:45:56', '2023-04-19 04:45:56', 2, 15),
(48, 'hay day', '2023-04-19 05:02:45', '2023-04-19 05:02:45', 6, 17),
(49, 'hayyyyyy', '2023-04-19 05:06:36', '2023-04-19 05:06:36', 1, 23),
(50, 'ok', '2023-04-19 07:31:26', '2023-04-19 07:31:26', 1, 8),
(51, 'hay', '2023-04-19 10:27:37', '2023-04-19 10:27:37', 8, 18),
(52, 'fasfsaf', '2023-04-23 12:57:34', '2023-04-23 12:57:34', 1, 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ratings`
--

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `bookId` int(11) NOT NULL,
  `rating` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `ratings`
--

INSERT INTO `ratings` (`id`, `userId`, `bookId`, `rating`, `createdAt`, `updatedAt`) VALUES
(30, 1, 4, 5, '2023-04-19 02:44:27', '2023-04-19 02:44:27'),
(31, 1, 22, 4, '2023-04-19 02:45:09', '2023-04-19 02:45:09'),
(32, 2, 22, 5, '2023-04-19 02:45:40', '2023-04-19 02:45:40'),
(33, 2, 6, 4, '2023-04-19 02:45:56', '2023-04-19 02:45:56'),
(34, 2, 14, 5, '2023-04-19 03:00:58', '2023-04-19 03:00:58'),
(35, 2, 19, 4, '2023-04-19 03:01:35', '2023-04-19 03:01:35'),
(36, 1, 14, 5, '2023-04-19 03:16:36', '2023-04-19 03:16:36'),
(37, 1, 16, 4, '2023-04-19 03:17:22', '2023-04-19 03:17:22'),
(38, 1, 8, 4, '2023-04-19 03:19:33', '2023-04-19 03:19:33'),
(39, 1, 6, 2, '2023-04-19 03:21:00', '2023-04-19 03:21:00'),
(40, 1, 24, 4, '2023-04-19 03:27:08', '2023-04-19 03:27:08'),
(41, 0, 0, 4, '2023-04-19 03:39:47', '2023-04-19 03:39:47'),
(42, 1, 18, 5, '2023-04-19 04:40:35', '2023-04-19 04:40:35'),
(43, 2, 18, 4, '2023-04-19 04:41:31', '2023-04-19 04:41:31'),
(44, 2, 8, 5, '2023-04-19 04:43:34', '2023-04-19 04:43:34'),
(45, 2, 17, 4, '2023-04-19 04:45:30', '2023-04-19 04:45:30'),
(46, 2, 15, 4, '2023-04-19 04:45:58', '2023-04-19 04:45:58'),
(47, 6, 18, 5, '2023-04-19 04:47:36', '2023-04-19 04:47:36'),
(48, 6, 20, 4, '2023-04-19 04:47:52', '2023-04-19 04:47:52'),
(49, 6, 8, 4, '2023-04-19 04:48:12', '2023-04-19 04:48:12'),
(50, 6, 19, 3, '2023-04-19 05:00:02', '2023-04-19 05:00:02'),
(51, 6, 17, 5, '2023-04-19 05:02:38', '2023-04-19 05:02:38'),
(52, 7, 8, 5, '2023-04-19 05:04:35', '2023-04-19 05:04:35'),
(53, 7, 18, 5, '2023-04-19 05:04:41', '2023-04-19 05:04:41'),
(54, 1, 23, 5, '2023-04-19 05:06:31', '2023-04-19 05:06:31'),
(55, 1, 10, 3, '2023-04-19 07:04:44', '2023-04-19 07:04:44'),
(56, 1, 17, 4, '2023-04-19 07:21:59', '2023-04-19 07:21:59'),
(57, 1, 19, 4, '2023-04-19 07:22:58', '2023-04-19 07:22:58'),
(58, 8, 18, 4, '2023-04-19 10:27:32', '2023-04-19 10:27:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `userId` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`userId`, `name`, `email`, `password`, `createdAt`, `updatedAt`) VALUES
(1, 'Đinh Ngọc Hoàng', 'ngochoang27810@gmail.com', '$2b$10$wnhpD99oMlV8.UHZxE6jNunJhIoL8tQDQPT6ogufSqeaPUXosCTkm', '2023-04-15 10:31:02', '2023-04-15 10:31:02'),
(2, 'hoangpc', 'dnhoang02@gmail.com', '$2b$10$P0Xxi.Eb7.XJ28A8uTjEd.Kt9SsQIfGFqs3XRcZtAzk1UJYQyJ0FC', '2023-04-15 12:07:04', '2023-04-15 12:07:04'),
(5, '123', '123@gmail.com', '$2b$10$b81CGqhQ9ckmp0sziCcm4OI7yz4hd.y0XIiS70IO5RSUdH/LKEXIe', '2023-04-18 09:01:55', '2023-04-18 09:01:55'),
(6, 'hoang', 'hoang@gmail.com', '$2b$10$kml2VKSsBXNotB/KZz/kcuGUD6W9IXySWGaYZpPgb9RaleAu8k83S', '2023-04-19 04:47:23', '2023-04-19 04:47:23'),
(7, 'Sachhay', 'sach@gmail.com', '$2b$10$7Y55ah3WlGiFlKgC1e2Pdu0jzDViqovQINZ.htKe4UoJXOazARMdm', '2023-04-19 05:04:05', '2023-04-19 05:04:05'),
(8, 'dinh hoang', 'ngochoang278100@gmail.com', '$2b$10$Qe9ZlF9OjFnDKw8MrKOEkOQSNnJUnqqXvVdWCXg0AaUXegVThh1Pu', '2023-04-19 10:27:14', '2023-04-19 10:27:14');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`bookId`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentId`),
  ADD KEY `userUserId` (`userUserId`),
  ADD KEY `bookBookId` (`bookBookId`);

--
-- Chỉ mục cho bảng `ratings`
--
ALTER TABLE `ratings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `books`
--
ALTER TABLE `books`
  MODIFY `bookId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `commentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT cho bảng `ratings`
--
ALTER TABLE `ratings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `userId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`userUserId`) REFERENCES `users` (`userId`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`bookBookId`) REFERENCES `books` (`bookId`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
