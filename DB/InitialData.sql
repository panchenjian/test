USE JOA

-- 地区: 中国
DECLARE @LOCATION_CN INT
DECLARE @LOCATION_CN_CODE VARCHAR(2)
SET @LOCATION_CN = 1
SET @LOCATION_CN_CODE = 'cn'

-- 地区: 台湾
DECLARE @LOCATION_TW INT
DECLARE @LOCATION_TW_CODE VARCHAR(2)
SET @LOCATION_TW = 2
SET @LOCATION_TW_CODE = 'tw'


/**
 * 新增 中国 Company
 */
DECLARE @COMPANY_NAME NVARCHAR(50)

SET @COMPANY_NAME = '上海乐丽网络科技有限公司'
IF NOT EXISTS (SELECT * FROM Company WHERE CompanyName = @COMPANY_NAME AND Location = @LOCATION_CN)
BEGIN
	INSERT INTO Company ([CompanyName],[Location]) VALUES (@COMPANY_NAME, @LOCATION_CN)
END

SET @COMPANY_NAME = '乐众网络科技(上海)有限公司'
IF NOT EXISTS (SELECT * FROM Company WHERE CompanyName = @COMPANY_NAME AND Location = @LOCATION_CN)
BEGIN
	INSERT INTO Company ([CompanyName],[Location]) VALUES (@COMPANY_NAME, @LOCATION_CN)
END

SET @COMPANY_NAME = '上海乐丽电子商务服务有限公司'
IF NOT EXISTS (SELECT * FROM Company WHERE CompanyName = @COMPANY_NAME AND Location = @LOCATION_CN)
BEGIN
	INSERT INTO Company ([CompanyName],[Location]) VALUES (@COMPANY_NAME, @LOCATION_CN)
END

SELECT * FROM Company


/**
 * 新增 职位
 * 执行长、副总经理、财务长、高级总监、总监、副总监、高级经理、经理、副经理、高级主管、主管、高级专员、专员、助理
 */
DECLARE @PositionCode VARCHAR(30)
DECLARE @PositionName NVARCHAR(50)
DECLARE @PositionLevel INT

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'ceo'
SET @PositionName = '执行长'
SET @PositionLevel = 1
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'vp'
SET @PositionName = '副总经理'
SET @PositionLevel = 3
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'cfo'
SET @PositionName = '财务长'
SET @PositionLevel = 3
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.director'
SET @PositionName = '高级总监'
SET @PositionLevel = 10
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'director'
SET @PositionName = '总监'
SET @PositionLevel = 12
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'assistant.director'
SET @PositionName = '副总监'
SET @PositionLevel = 14
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.manager'
SET @PositionName = '高级经理'
SET @PositionLevel = 20
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'manager'
SET @PositionName = '经理'
SET @PositionLevel = 22
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'assistant.manager'
SET @PositionName = '副经理'
SET @PositionLevel = 24
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.supervisor'
SET @PositionName = '高级主管'
SET @PositionLevel = 30
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'supervisor'
SET @PositionName = '主管'
SET @PositionLevel = 32
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.executive'
SET @PositionName = '高级专员'
SET @PositionLevel = 40
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'executive'
SET @PositionName = '专员'
SET @PositionLevel = 42
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'assistant'
SET @PositionName = '助理'
SET @PositionLevel = 44
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.engineer'
SET @PositionName = '资深工程师'
SET @PositionLevel = 50
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'engineer'
SET @PositionName = '工程师'
SET @PositionLevel = 52
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.designer'
SET @PositionName = '资深设计师'
SET @PositionLevel = 50
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'designer'
SET @PositionName = '设计师'
SET @PositionLevel = 52
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SELECT * FROM Position


/**
 * 新增 职能
 * 运营、企划、开发、管理、设计、财务、运维、产品、客服、市场、BD、顾问
 */
DECLARE @FunctionCode VARCHAR(20)
DECLARE @FunctionName NVARCHAR(50)
DECLARE @Rank INT

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'sales'
SET @FunctionName = '运营'
SET @Rank = 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'plan'
SET @FunctionName = '企划'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'rd'
SET @FunctionName = '开发'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'manage'
SET @FunctionName = '管理'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'design'
SET @FunctionName = '设计'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'finance'
SET @FunctionName = '财务'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'operate'
SET @FunctionName = '运维'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'product'
SET @FunctionName = '产品'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'customer.service'
SET @FunctionName = '客服'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'marketing'
SET @FunctionName = '市场'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'bd'
SET @FunctionName = 'BD'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'consultant'
SET @FunctionName = '顾问'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SELECT * FROM JobFunction



/**
 * 新增 部门
 */
DECLARE @DepartmentCode VARCHAR(20)
DECLARE @DepartmentName NVARCHAR(50)
DECLARE @Level INT
DECLARE @ParentId INT

-- 总经理办公室
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'go'
SET @DepartmentName = '总经理办公室'
SET @Rank = 1
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'bd'
SET @DepartmentName = 'BD'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- BO1
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'bo1'
SET @DepartmentName = '品牌事业1部'
SET @Rank = 2
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'naruko'
SET @DepartmentName = 'Naruko'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'erno'
SET @DepartmentName = '奥伦纳素'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'sales'
SET @DepartmentName = '业务部'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- BO2
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'bo2'
SET @DepartmentName = '品牌事业2部'
SET @Rank = 3
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'motorola'
SET @DepartmentName = '摩托罗拉'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'neogence'
SET @DepartmentName = '霓净思'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'gillette'
SET @DepartmentName = '吉列'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'lovemore'
SET @DepartmentName = '爱恋膜法'
SET @Rank = 4
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'citycolor'
SET @DepartmentName = 'CityColor'
SET @Rank = 5
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- BO3
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'bo3'
SET @DepartmentName = '品牌事业3部'
SET @Rank = 4
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'greendays'
SET @DepartmentName = '绿叠子'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'crown'
SET @DepartmentName = '皇冠'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'ichido'
SET @DepartmentName = '宜芝多'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'pili'
SET @DepartmentName = '霹雳'
SET @Rank = 4
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + '2ya'
SET @DepartmentName = '二丫网'
SET @Rank = 5
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'xxdd'
SET @DepartmentName = '星星的店'
SET @Rank = 6
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'pegavision'
SET @DepartmentName = '晶硕'
SET @Rank = 7
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'bo3.cs'
SET @DepartmentName = '品牌事业3部客服部'
SET @Rank = 8
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- 管理部
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'ad'
SET @DepartmentName = '管理部'
SET @Rank = 5
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'hr'
SET @DepartmentName = '人事部'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'law'
SET @DepartmentName = '法务部'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'affairs'
SET @DepartmentName = '行政部'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- 品牌视觉部
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'bv'
SET @DepartmentName = '品牌视觉部'
SET @Rank = 6
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

-- 技术开发部
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'rd'
SET @DepartmentName = '技术开发部'
SET @Rank = 7
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'rd.team.1'
SET @DepartmentName = '项目一组'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'rd.team.2'
SET @DepartmentName = '项目二组'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'mis'
SET @DepartmentName = '运维'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- 客服部
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs'
SET @DepartmentName = '客服部'
SET @Rank = 8
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.after'
SET @DepartmentName = '售后组'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.naruko'
SET @DepartmentName = 'Naruko客服部'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.team.2'
SET @DepartmentName = '客服二组'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.team.3'
SET @DepartmentName = '客服三组'
SET @Rank = 4
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.team.4'
SET @DepartmentName = '客服四组'
SET @Rank = 5
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.team.5'
SET @DepartmentName = '客服五组'
SET @Rank = 6
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.motorola'
SET @DepartmentName = 'Moto客服部'
SET @Rank = 7
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- 财务部
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'finance'
SET @DepartmentName = '财务部'
SET @Rank = 9
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END


SELECT * FROM Department


/**
 * 新增 请假类型
 * 年假、事假、病假、婚假、丧假、旷职、出差
 */
DECLARE @LeaveCode VARCHAR(50)
DECLARE @LeaveName NVARCHAR(50)
DECLARE @LeaveRule NVARCHAR(4000)
DECLARE @IsNeedHrAudit BIT

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'annual'
SET @LeaveName = '年假'
SET @LeaveRule = '员工自入职日起，满一年可享受带薪年假，年假的使用期限为一年。'
SET @IsNeedHrAudit = 0
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'personal'
SET @LeaveName = '事假'
SET @LeaveRule = '经主管批准后员工因私事需请假可请事假。'
SET @IsNeedHrAudit = 0
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'marriage'
SET @LeaveName = '婚假'
SET @LeaveRule = '员工休婚假需至少提前一个月填写请假单并附结婚证明向部门主管申请并报人事行政部门审批。'
SET @IsNeedHrAudit = 1
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'maternity'
SET @LeaveName = '产假'
SET @LeaveRule = '员工请产假等需提前向部门主管申请并报人事行政部门审批。'
SET @IsNeedHrAudit = 1
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'sick'
SET @LeaveName = '病假'
SET @LeaveRule = '员工因病或非因工负伤需请病假的，须经医务部门开出的休息证明及病例证明并及时交部门领导批准。'
SET @IsNeedHrAudit = 0
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'funeral'
SET @LeaveName = '丧假'
SET @LeaveRule = '员工请丧家需提前申请，并附上相关证明向部门主管申请批准后交人事行政部审批。'
SET @IsNeedHrAudit = 1
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'injury'
SET @LeaveName = '工伤假'
SET @LeaveRule = '工伤员工所在部门须在 3 天内填写工伤假申请表连同医务部门证明交人事行政部门审批。'
SET @IsNeedHrAudit = 1
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END


SELECT * FROM LeaveType


/**
 * 新增 工作日类型
 */
DECLARE @TypeCode VARCHAR(20)
DECLARE @WorkingHours DECIMAL(10, 2)
DECLARE @Description NVARCHAR(500)
DECLARE @IsFlexTime BIT
DECLARE @IsSpecialDay BIT
DECLARE @IsMealAllowance BIT


SET @TypeCode = @LOCATION_CN_CODE + '.' + 'flex'
SET @WorkingHours = 9
SET @Description = '上班时间，有一次打卡记录即可'
SET @Rank = 1
SET @IsFlexTime = 1
SET @IsSpecialDay = 0
SET @IsMealAllowance = 0
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'弹性工时','09:30','18:30',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'18:30','19:30')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'regular'
SET @WorkingHours = 9
SET @Description = '周休二日，正常上下班'
SET @Rank = 2
SET @IsFlexTime = 0
SET @IsSpecialDay = 0
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'正常工时','09:30','18:30',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'18:30','19:30')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'finance'
SET @WorkingHours = 9
SET @Description = '财务上班时间，比平常早1小时'
SET @Rank = 3
SET @IsFlexTime = 0
SET @IsSpecialDay = 0
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'财务工时','08:30','15:30',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'18:30','19:30')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'cs.a'
SET @WorkingHours = 12
SET @Description = '作一休一，AB互轮'
SET @Rank = 4
SET @IsFlexTime = 0
SET @IsSpecialDay = 1
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'客服A班','09:00','21:00',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'21:00','22:00')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'cs.b'
SET @WorkingHours = 12
SET @Description = '作一休一，AB互轮'
SET @Rank = 5
SET @IsFlexTime = 0
SET @IsSpecialDay = 1
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'客服B班','09:00','21:00',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'21:00','22:00')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'cs.c'
SET @WorkingHours = 7.5
SET @Description = '作六休一'
SET @Rank = 6
SET @IsFlexTime = 0
SET @IsSpecialDay = 1
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'客服C班','09:30','17:00',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'18:30','19:30')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'lactation'
SET @WorkingHours = 8
SET @Description = '每天可以迟到或早退一小时'
SET @Rank = 7
SET @IsFlexTime = 0
SET @IsSpecialDay = 0
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'哺乳班次','09:30','18:30',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'18:30','19:30')
END


SELECT * FROM WorkingDayType


/**
 * 新增 角色
 */
DECLARE @RoleCode VARCHAR(20)
DECLARE @RoleName NVARCHAR(20)
DECLARE @RoleLevel INT

SET @RoleCode = @LOCATION_CN_CODE + '.' + 'super'
SET @RoleName = '超级管理员'
SET @RoleLevel = 1
IF NOT EXISTS (SELECT * FROM [Role] WHERE RoleCode = @RoleCode)
BEGIN	
	INSERT INTO [Role] ([RoleCode],[RoleName],[RoleLevel],[CreateTime],[IsEnabled],[Location]) VALUES (@RoleCode,@RoleName,@RoleLevel,GETDATE(),1,@LOCATION_CN)
END

SET @RoleCode = @LOCATION_CN_CODE + '.' + 'hr'
SET @RoleName = '人事'
SET @RoleLevel = 3
IF NOT EXISTS (SELECT * FROM [Role] WHERE RoleCode = @RoleCode)
BEGIN	
	INSERT INTO [Role] ([RoleCode],[RoleName],[RoleLevel],[CreateTime],[IsEnabled],[Location]) VALUES (@RoleCode,@RoleName,@RoleLevel,GETDATE(),1,@LOCATION_CN)
END

SET @RoleCode = @LOCATION_CN_CODE + '.' + 'affairs'
SET @RoleName = '行政'
SET @RoleLevel = 3
IF NOT EXISTS (SELECT * FROM [Role] WHERE RoleCode = @RoleCode)
BEGIN	
	INSERT INTO [Role] ([RoleCode],[RoleName],[RoleLevel],[CreateTime],[IsEnabled],[Location]) VALUES (@RoleCode,@RoleName,@RoleLevel,GETDATE(),1,@LOCATION_CN)
END

SET @RoleCode = @LOCATION_CN_CODE + '.' + 'finance'
SET @RoleName = '财务'
SET @RoleLevel = 3
IF NOT EXISTS (SELECT * FROM [Role] WHERE RoleCode = @RoleCode)
BEGIN	
	INSERT INTO [Role] ([RoleCode],[RoleName],[RoleLevel],[CreateTime],[IsEnabled],[Location]) VALUES (@RoleCode,@RoleName,@RoleLevel,GETDATE(),1,@LOCATION_CN)
END

SET @RoleCode = @LOCATION_CN_CODE + '.' + 'employee'
SET @RoleName = '一般员工'
SET @RoleLevel = 7
IF NOT EXISTS (SELECT * FROM [Role] WHERE RoleCode = @RoleCode)
BEGIN	
	INSERT INTO [Role] ([RoleCode],[RoleName],[RoleLevel],[CreateTime],[IsEnabled],[Location]) VALUES (@RoleCode,@RoleName,@RoleLevel,GETDATE(),1,@LOCATION_CN)
END


SELECT * FROM [Role]

/**
 * 新增 菜单
 */
DECLARE @MenuCode VARCHAR(30)
DECLARE @ActionPath VARCHAR(50)
DECLARE @MenuName NVARCHAR(10)
DECLARE @MenuLevel INT
DECLARE @ParentMenuId INT
DECLARE @NavigateCode VARCHAR(30)

-- 个人专区
SET @MenuCode = 'Personal'
SET @MenuName = '个人专区'
SET @ActionPath = '#'
SET @Rank = 1
SET @MenuLevel = 1
SET @ParentMenuId = 0
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
	SET @ParentMenuId = @@IDENTITY
END

SET @MenuCode = 'Attendance' + '.' + 'Index'
SET @MenuName = '我的考勤'
SET @ActionPath = '/Attendance/Index'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'Personal' + '.' + 'Profile'
SET @MenuName = '我的信息'
SET @ActionPath = '/Personal/Profile'
SET @Rank = 2
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END


SET @MenuCode = 'Vocation' + '.' + 'Index'
SET @MenuName = '我的假期'
SET @ActionPath = '/Vocation/Index'
SET @Rank = 3
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END


SET @MenuCode = 'Personal' + '.' + 'Email'
SET @MenuName = '我的邮件'
SET @ActionPath = '/Personal/Email'
SET @Rank = 4
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

-- 电子签核
SET @MenuCode = 'Audit'
SET @MenuName = '电子签核'
SET @ActionPath = '#'
SET @Rank = 2
SET @MenuLevel = 1
SET @ParentMenuId = 0
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
	SET @ParentMenuId = @@IDENTITY
END

SET @MenuCode = 'LeaveReq' + '.' + 'Send'
SET @MenuName = '我要请假'
SET @ActionPath = '/LeaveReq/Send'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'TravelReq' + '.' + 'Send'
SET @MenuName = '我要出差'
SET @ActionPath = '/TravelReq/Send'
SET @Rank = 2
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PayReq' + '.' + 'Send'
SET @MenuName = '我要请款'
SET @ActionPath = '/PayReq/Send'
SET @Rank = 3
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

-- 公共专区
SET @MenuCode = 'PubArea'
SET @MenuName = '公共专区'
SET @ActionPath = '#'
SET @Rank = 3
SET @MenuLevel = 1
SET @ParentMenuId = 0
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
	SET @ParentMenuId = @@IDENTITY
END

SET @MenuCode = 'PubArea' + '.' + 'Index'
SET @MenuName = '公告区'
SET @ActionPath = '/PubArea/Index'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PubArea' + '.' + 'Wiki'
SET @MenuName = '乐丽黄页'
SET @ActionPath = '/PubArea/Wiki'
SET @Rank = 2
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PubArea' + '.' + 'Policy'
SET @MenuName = '规章制度'
SET @ActionPath = '/PubArea/Policy'
SET @Rank = 3
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PubArea' + '.' + 'Download'
SET @MenuName = '表单下载'
SET @ActionPath = '/PubArea/Download'
SET @Rank = 4
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PubArea' + '.' + 'Gallery'
SET @MenuName = '公司相册'
SET @ActionPath = '/PubArea/Gallery'
SET @Rank = 5
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PubArea' + '.' + 'Location'
SET @MenuName = '办公位置'
SET @ActionPath = '/PubArea/Location'
SET @Rank = 6
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

-- 人事管理
SET @MenuCode = 'Hr'
SET @MenuName = '人事管理'
SET @ActionPath = '#'
SET @Rank = 4
SET @MenuLevel = 1
SET @ParentMenuId = 0
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
	SET @ParentMenuId = @@IDENTITY
END

SET @MenuCode = 'WorkingDay' + '.' + 'Manage'
SET @MenuName = '工作日设置'
SET @ActionPath = '/WorkingDay/Manage'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'Attendance' + '.' + 'Manage'
SET @MenuName = '考勤管理'
SET @ActionPath = '/Attendance/Manage'
SET @Rank = 2
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

-- 财务管理
SET @MenuCode = 'Finance'
SET @MenuName = '财务管理'
SET @ActionPath = '#'
SET @Rank = 5
SET @MenuLevel = 1
SET @ParentMenuId = 0
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
	SET @ParentMenuId = @@IDENTITY
END

SET @MenuCode = 'Payment' + '.' + 'Manage'
SET @MenuName = '工资设置'
SET @ActionPath = '/Payment/Manage'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

-- 系统管理
SET @MenuCode = 'System'
SET @MenuName = '系统管理'
SET @ActionPath = '#'
SET @Rank = 6
SET @MenuLevel = 1
SET @ParentMenuId = 0
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
	SET @ParentMenuId = @@IDENTITY
END

SET @MenuCode = 'Employee' + '.' + 'Manage'
SET @MenuName = '员工管理'
SET @ActionPath = '/Employee/Manage'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'Role' + '.' + 'Manage'
SET @MenuName = '角色管理'
SET @ActionPath = '/Role/Manage'
SET @Rank = 2
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END


SET @MenuCode = 'Menu' + '.' + 'Manage'
SET @MenuName = '菜单管理'
SET @ActionPath = '/Menu/Manage'
SET @Rank = 3
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END


SET @MenuCode = 'Department' + '.' + 'Manage'
SET @MenuName = '部门管理'
SET @ActionPath = '/Department/Manage'
SET @Rank = 4
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END
