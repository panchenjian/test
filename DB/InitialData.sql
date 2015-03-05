USE JOA

-- ����: �й�
DECLARE @LOCATION_CN INT
DECLARE @LOCATION_CN_CODE VARCHAR(2)
SET @LOCATION_CN = 1
SET @LOCATION_CN_CODE = 'cn'

-- ����: ̨��
DECLARE @LOCATION_TW INT
DECLARE @LOCATION_TW_CODE VARCHAR(2)
SET @LOCATION_TW = 2
SET @LOCATION_TW_CODE = 'tw'


/**
 * ���� �й� Company
 */
DECLARE @COMPANY_NAME NVARCHAR(50)

SET @COMPANY_NAME = '�Ϻ���������Ƽ����޹�˾'
IF NOT EXISTS (SELECT * FROM Company WHERE CompanyName = @COMPANY_NAME AND Location = @LOCATION_CN)
BEGIN
	INSERT INTO Company ([CompanyName],[Location]) VALUES (@COMPANY_NAME, @LOCATION_CN)
END

SET @COMPANY_NAME = '��������Ƽ�(�Ϻ�)���޹�˾'
IF NOT EXISTS (SELECT * FROM Company WHERE CompanyName = @COMPANY_NAME AND Location = @LOCATION_CN)
BEGIN
	INSERT INTO Company ([CompanyName],[Location]) VALUES (@COMPANY_NAME, @LOCATION_CN)
END

SET @COMPANY_NAME = '�Ϻ�������������������޹�˾'
IF NOT EXISTS (SELECT * FROM Company WHERE CompanyName = @COMPANY_NAME AND Location = @LOCATION_CN)
BEGIN
	INSERT INTO Company ([CompanyName],[Location]) VALUES (@COMPANY_NAME, @LOCATION_CN)
END

SELECT * FROM Company


/**
 * ���� ְλ
 * ִ�г������ܾ������񳤡��߼��ܼࡢ�ܼࡢ���ܼࡢ�߼����������������߼����ܡ����ܡ��߼�רԱ��רԱ������
 */
DECLARE @PositionCode VARCHAR(30)
DECLARE @PositionName NVARCHAR(50)
DECLARE @PositionLevel INT

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'ceo'
SET @PositionName = 'ִ�г�'
SET @PositionLevel = 1
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'vp'
SET @PositionName = '���ܾ���'
SET @PositionLevel = 3
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'cfo'
SET @PositionName = '����'
SET @PositionLevel = 3
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.director'
SET @PositionName = '�߼��ܼ�'
SET @PositionLevel = 10
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'director'
SET @PositionName = '�ܼ�'
SET @PositionLevel = 12
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'assistant.director'
SET @PositionName = '���ܼ�'
SET @PositionLevel = 14
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.manager'
SET @PositionName = '�߼�����'
SET @PositionLevel = 20
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'manager'
SET @PositionName = '����'
SET @PositionLevel = 22
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'assistant.manager'
SET @PositionName = '������'
SET @PositionLevel = 24
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.supervisor'
SET @PositionName = '�߼�����'
SET @PositionLevel = 30
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'supervisor'
SET @PositionName = '����'
SET @PositionLevel = 32
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.executive'
SET @PositionName = '�߼�רԱ'
SET @PositionLevel = 40
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'executive'
SET @PositionName = 'רԱ'
SET @PositionLevel = 42
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'assistant'
SET @PositionName = '����'
SET @PositionLevel = 44
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.engineer'
SET @PositionName = '�����ʦ'
SET @PositionLevel = 50
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'engineer'
SET @PositionName = '����ʦ'
SET @PositionLevel = 52
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'senior.designer'
SET @PositionName = '�������ʦ'
SET @PositionLevel = 50
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SET @PositionCode = @LOCATION_CN_CODE + '.' + 'designer'
SET @PositionName = '���ʦ'
SET @PositionLevel = 52
IF NOT EXISTS (SELECT * FROM Position WHERE PositionCode = @PositionCode)
BEGIN
	INSERT INTO Position ([PositionCode],[PositionName],[Level],[CreateTime],[IsEnabled],[Location]) VALUES (@PositionCode, @PositionName, @PositionLevel, GETDATE() , 1, @LOCATION_CN)
END

SELECT * FROM Position


/**
 * ���� ְ��
 * ��Ӫ���󻮡�������������ơ�������ά����Ʒ���ͷ����г���BD������
 */
DECLARE @FunctionCode VARCHAR(20)
DECLARE @FunctionName NVARCHAR(50)
DECLARE @Rank INT

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'sales'
SET @FunctionName = '��Ӫ'
SET @Rank = 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'plan'
SET @FunctionName = '��'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'rd'
SET @FunctionName = '����'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'manage'
SET @FunctionName = '����'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'design'
SET @FunctionName = '���'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'finance'
SET @FunctionName = '����'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'operate'
SET @FunctionName = '��ά'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'product'
SET @FunctionName = '��Ʒ'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'customer.service'
SET @FunctionName = '�ͷ�'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SET @FunctionCode = @LOCATION_CN_CODE + '.' + 'marketing'
SET @FunctionName = '�г�'
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
SET @FunctionName = '����'
SET @Rank = @Rank + 1
IF NOT EXISTS (SELECT * FROM JobFunction WHERE FunctionCode = @FunctionCode)
BEGIN
	INSERT INTO JobFunction ([FunctionCode],[FunctionName],[CreateTime],[Rank],[Location]) VALUES (@FunctionCode,@FunctionName,GETDATE(),@Rank,@LOCATION_CN)
END

SELECT * FROM JobFunction



/**
 * ���� ����
 */
DECLARE @DepartmentCode VARCHAR(20)
DECLARE @DepartmentName NVARCHAR(50)
DECLARE @Level INT
DECLARE @ParentId INT

-- �ܾ���칫��
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'go'
SET @DepartmentName = '�ܾ���칫��'
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
SET @DepartmentName = 'Ʒ����ҵ1��'
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
SET @DepartmentName = '��������'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'sales'
SET @DepartmentName = 'ҵ��'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- BO2
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'bo2'
SET @DepartmentName = 'Ʒ����ҵ2��'
SET @Rank = 3
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'motorola'
SET @DepartmentName = 'Ħ������'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'neogence'
SET @DepartmentName = '�޾�˼'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'gillette'
SET @DepartmentName = '����'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'lovemore'
SET @DepartmentName = '����Ĥ��'
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
SET @DepartmentName = 'Ʒ����ҵ3��'
SET @Rank = 4
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'greendays'
SET @DepartmentName = '�̵���'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'crown'
SET @DepartmentName = '�ʹ�'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'ichido'
SET @DepartmentName = '��֥��'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'pili'
SET @DepartmentName = '����'
SET @Rank = 4
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + '2ya'
SET @DepartmentName = '��Ѿ��'
SET @Rank = 5
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'xxdd'
SET @DepartmentName = '���ǵĵ�'
SET @Rank = 6
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'pegavision'
SET @DepartmentName = '��˶'
SET @Rank = 7
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'bo3.cs'
SET @DepartmentName = 'Ʒ����ҵ3���ͷ���'
SET @Rank = 8
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- ����
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'ad'
SET @DepartmentName = '����'
SET @Rank = 5
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'hr'
SET @DepartmentName = '���²�'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'law'
SET @DepartmentName = '����'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'affairs'
SET @DepartmentName = '������'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- Ʒ���Ӿ���
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'bv'
SET @DepartmentName = 'Ʒ���Ӿ���'
SET @Rank = 6
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

-- ����������
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'rd'
SET @DepartmentName = '����������'
SET @Rank = 7
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'rd.team.1'
SET @DepartmentName = '��Ŀһ��'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'rd.team.2'
SET @DepartmentName = '��Ŀ����'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'mis'
SET @DepartmentName = '��ά'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- �ͷ���
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs'
SET @DepartmentName = '�ͷ���'
SET @Rank = 8
SET @Level = 1
SET @ParentId = 0
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
	SET @ParentId = @@IDENTITY
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.after'
SET @DepartmentName = '�ۺ���'
SET @Rank = 1
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.naruko'
SET @DepartmentName = 'Naruko�ͷ���'
SET @Rank = 2
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.team.2'
SET @DepartmentName = '�ͷ�����'
SET @Rank = 3
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.team.3'
SET @DepartmentName = '�ͷ�����'
SET @Rank = 4
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.team.4'
SET @DepartmentName = '�ͷ�����'
SET @Rank = 5
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.team.5'
SET @DepartmentName = '�ͷ�����'
SET @Rank = 6
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'cs.motorola'
SET @DepartmentName = 'Moto�ͷ���'
SET @Rank = 7
SET @Level = 2
IF NOT EXISTS (SELECT * FROM Department WHERE DepartmentCode = @DepartmentCode)
BEGIN
	INSERT INTO Department ([DepartmentCode],[DepartmentName],[Level],[ParentId],[CreateTime],[Rank],[IsEnabled],[Location]) VALUES (@DepartmentCode,@DepartmentName,@Level,@ParentId,GETDATE(),@Rank,1,@LOCATION_CN)	
END

-- ����
SET @DepartmentCode = @LOCATION_CN_CODE + '.' + 'finance'
SET @DepartmentName = '����'
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
 * ���� �������
 * ��١��¼١����١���١�ɥ�١���ְ������
 */
DECLARE @LeaveCode VARCHAR(50)
DECLARE @LeaveName NVARCHAR(50)
DECLARE @LeaveRule NVARCHAR(4000)
DECLARE @IsNeedHrAudit BIT

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'annual'
SET @LeaveName = '���'
SET @LeaveRule = 'Ա������ְ������һ������ܴ�н��٣���ٵ�ʹ������Ϊһ�ꡣ'
SET @IsNeedHrAudit = 0
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'personal'
SET @LeaveName = '�¼�'
SET @LeaveRule = '��������׼��Ա����˽������ٿ����¼١�'
SET @IsNeedHrAudit = 0
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'marriage'
SET @LeaveName = '���'
SET @LeaveRule = 'Ա���ݻ����������ǰһ������д��ٵ��������֤�������������벢��������������������'
SET @IsNeedHrAudit = 1
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'maternity'
SET @LeaveName = '����'
SET @LeaveRule = 'Ա������ٵ�����ǰ�����������벢��������������������'
SET @IsNeedHrAudit = 1
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'sick'
SET @LeaveName = '����'
SET @LeaveRule = 'Ա���򲡻���򹤸������벡�ٵģ��뾭ҽ���ſ�������Ϣ֤��������֤������ʱ�������쵼��׼��'
SET @IsNeedHrAudit = 0
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'funeral'
SET @LeaveName = 'ɥ��'
SET @LeaveRule = 'Ա����ɥ������ǰ���룬���������֤����������������׼������������������'
SET @IsNeedHrAudit = 1
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END

SET @LeaveCode = @LOCATION_CN_CODE + '.' + 'injury'
SET @LeaveName = '���˼�'
SET @LeaveRule = '����Ա�����ڲ������� 3 ������д���˼��������ͬҽ����֤����������������������'
SET @IsNeedHrAudit = 1
IF NOT EXISTS (SELECT * FROM LeaveType WHERE LeaveCode = @LeaveCode)
BEGIN
	INSERT INTO LeaveType ([LeaveCode],[LeaveName],[LeaveRule],[IsNeedHrAudit],[Location]) VALUES (@LeaveCode,@LeaveName,@LeaveRule,@IsNeedHrAudit,@LOCATION_CN)
END


SELECT * FROM LeaveType


/**
 * ���� ����������
 */
DECLARE @TypeCode VARCHAR(20)
DECLARE @WorkingHours DECIMAL(10, 2)
DECLARE @Description NVARCHAR(500)
DECLARE @IsFlexTime BIT
DECLARE @IsSpecialDay BIT
DECLARE @IsMealAllowance BIT


SET @TypeCode = @LOCATION_CN_CODE + '.' + 'flex'
SET @WorkingHours = 9
SET @Description = '�ϰ�ʱ�䣬��һ�δ򿨼�¼����'
SET @Rank = 1
SET @IsFlexTime = 1
SET @IsSpecialDay = 0
SET @IsMealAllowance = 0
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'���Թ�ʱ','09:30','18:30',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'18:30','19:30')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'regular'
SET @WorkingHours = 9
SET @Description = '���ݶ��գ��������°�'
SET @Rank = 2
SET @IsFlexTime = 0
SET @IsSpecialDay = 0
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'������ʱ','09:30','18:30',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'18:30','19:30')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'finance'
SET @WorkingHours = 9
SET @Description = '�����ϰ�ʱ�䣬��ƽ����1Сʱ'
SET @Rank = 3
SET @IsFlexTime = 0
SET @IsSpecialDay = 0
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'����ʱ','08:30','15:30',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'18:30','19:30')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'cs.a'
SET @WorkingHours = 12
SET @Description = '��һ��һ��AB����'
SET @Rank = 4
SET @IsFlexTime = 0
SET @IsSpecialDay = 1
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'�ͷ�A��','09:00','21:00',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'21:00','22:00')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'cs.b'
SET @WorkingHours = 12
SET @Description = '��һ��һ��AB����'
SET @Rank = 5
SET @IsFlexTime = 0
SET @IsSpecialDay = 1
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'�ͷ�B��','09:00','21:00',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'21:00','22:00')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'cs.c'
SET @WorkingHours = 7.5
SET @Description = '������һ'
SET @Rank = 6
SET @IsFlexTime = 0
SET @IsSpecialDay = 1
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'�ͷ�C��','09:30','17:00',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'18:30','19:30')
END

SET @TypeCode = @LOCATION_CN_CODE + '.' + 'lactation'
SET @WorkingHours = 8
SET @Description = 'ÿ����Գٵ�������һСʱ'
SET @Rank = 7
SET @IsFlexTime = 0
SET @IsSpecialDay = 0
SET @IsMealAllowance = 1
IF NOT EXISTS (SELECT * FROM WorkingDayType WHERE TypeCode = @TypeCode)
BEGIN	
	INSERT INTO WorkingDayType ([TypeCode],[TypeName],[StartTime],[EndTime],[LateMinutes],[WorkingHours],[Description],[Rank],[Location],[IsFlexTime],[IsSpecialDay],[IsMealAllowance],[StartDiningTime],[EndDiningTime]) VALUES 
	(@TypeCode,'������','09:30','18:30',10,@WorkingHours,@Description,@Rank,@LOCATION_CN,@IsFlexTime,@IsSpecialDay,@IsMealAllowance,'18:30','19:30')
END


SELECT * FROM WorkingDayType


/**
 * ���� ��ɫ
 */
DECLARE @RoleCode VARCHAR(20)
DECLARE @RoleName NVARCHAR(20)
DECLARE @RoleLevel INT

SET @RoleCode = @LOCATION_CN_CODE + '.' + 'super'
SET @RoleName = '��������Ա'
SET @RoleLevel = 1
IF NOT EXISTS (SELECT * FROM [Role] WHERE RoleCode = @RoleCode)
BEGIN	
	INSERT INTO [Role] ([RoleCode],[RoleName],[RoleLevel],[CreateTime],[IsEnabled],[Location]) VALUES (@RoleCode,@RoleName,@RoleLevel,GETDATE(),1,@LOCATION_CN)
END

SET @RoleCode = @LOCATION_CN_CODE + '.' + 'hr'
SET @RoleName = '����'
SET @RoleLevel = 3
IF NOT EXISTS (SELECT * FROM [Role] WHERE RoleCode = @RoleCode)
BEGIN	
	INSERT INTO [Role] ([RoleCode],[RoleName],[RoleLevel],[CreateTime],[IsEnabled],[Location]) VALUES (@RoleCode,@RoleName,@RoleLevel,GETDATE(),1,@LOCATION_CN)
END

SET @RoleCode = @LOCATION_CN_CODE + '.' + 'affairs'
SET @RoleName = '����'
SET @RoleLevel = 3
IF NOT EXISTS (SELECT * FROM [Role] WHERE RoleCode = @RoleCode)
BEGIN	
	INSERT INTO [Role] ([RoleCode],[RoleName],[RoleLevel],[CreateTime],[IsEnabled],[Location]) VALUES (@RoleCode,@RoleName,@RoleLevel,GETDATE(),1,@LOCATION_CN)
END

SET @RoleCode = @LOCATION_CN_CODE + '.' + 'finance'
SET @RoleName = '����'
SET @RoleLevel = 3
IF NOT EXISTS (SELECT * FROM [Role] WHERE RoleCode = @RoleCode)
BEGIN	
	INSERT INTO [Role] ([RoleCode],[RoleName],[RoleLevel],[CreateTime],[IsEnabled],[Location]) VALUES (@RoleCode,@RoleName,@RoleLevel,GETDATE(),1,@LOCATION_CN)
END

SET @RoleCode = @LOCATION_CN_CODE + '.' + 'employee'
SET @RoleName = 'һ��Ա��'
SET @RoleLevel = 7
IF NOT EXISTS (SELECT * FROM [Role] WHERE RoleCode = @RoleCode)
BEGIN	
	INSERT INTO [Role] ([RoleCode],[RoleName],[RoleLevel],[CreateTime],[IsEnabled],[Location]) VALUES (@RoleCode,@RoleName,@RoleLevel,GETDATE(),1,@LOCATION_CN)
END


SELECT * FROM [Role]

/**
 * ���� �˵�
 */
DECLARE @MenuCode VARCHAR(30)
DECLARE @ActionPath VARCHAR(50)
DECLARE @MenuName NVARCHAR(10)
DECLARE @MenuLevel INT
DECLARE @ParentMenuId INT
DECLARE @NavigateCode VARCHAR(30)

-- ����ר��
SET @MenuCode = 'Personal'
SET @MenuName = '����ר��'
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
SET @MenuName = '�ҵĿ���'
SET @ActionPath = '/Attendance/Index'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'Personal' + '.' + 'Profile'
SET @MenuName = '�ҵ���Ϣ'
SET @ActionPath = '/Personal/Profile'
SET @Rank = 2
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END


SET @MenuCode = 'Vocation' + '.' + 'Index'
SET @MenuName = '�ҵļ���'
SET @ActionPath = '/Vocation/Index'
SET @Rank = 3
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END


SET @MenuCode = 'Personal' + '.' + 'Email'
SET @MenuName = '�ҵ��ʼ�'
SET @ActionPath = '/Personal/Email'
SET @Rank = 4
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

-- ����ǩ��
SET @MenuCode = 'Audit'
SET @MenuName = '����ǩ��'
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
SET @MenuName = '��Ҫ���'
SET @ActionPath = '/LeaveReq/Send'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'TravelReq' + '.' + 'Send'
SET @MenuName = '��Ҫ����'
SET @ActionPath = '/TravelReq/Send'
SET @Rank = 2
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PayReq' + '.' + 'Send'
SET @MenuName = '��Ҫ���'
SET @ActionPath = '/PayReq/Send'
SET @Rank = 3
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

-- ����ר��
SET @MenuCode = 'PubArea'
SET @MenuName = '����ר��'
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
SET @MenuName = '������'
SET @ActionPath = '/PubArea/Index'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PubArea' + '.' + 'Wiki'
SET @MenuName = '������ҳ'
SET @ActionPath = '/PubArea/Wiki'
SET @Rank = 2
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PubArea' + '.' + 'Policy'
SET @MenuName = '�����ƶ�'
SET @ActionPath = '/PubArea/Policy'
SET @Rank = 3
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PubArea' + '.' + 'Download'
SET @MenuName = '������'
SET @ActionPath = '/PubArea/Download'
SET @Rank = 4
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PubArea' + '.' + 'Gallery'
SET @MenuName = '��˾���'
SET @ActionPath = '/PubArea/Gallery'
SET @Rank = 5
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'PubArea' + '.' + 'Location'
SET @MenuName = '�칫λ��'
SET @ActionPath = '/PubArea/Location'
SET @Rank = 6
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

-- ���¹���
SET @MenuCode = 'Hr'
SET @MenuName = '���¹���'
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
SET @MenuName = '����������'
SET @ActionPath = '/WorkingDay/Manage'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'Attendance' + '.' + 'Manage'
SET @MenuName = '���ڹ���'
SET @ActionPath = '/Attendance/Manage'
SET @Rank = 2
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

-- �������
SET @MenuCode = 'Finance'
SET @MenuName = '�������'
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
SET @MenuName = '��������'
SET @ActionPath = '/Payment/Manage'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

-- ϵͳ����
SET @MenuCode = 'System'
SET @MenuName = 'ϵͳ����'
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
SET @MenuName = 'Ա������'
SET @ActionPath = '/Employee/Manage'
SET @Rank = 1
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END

SET @MenuCode = 'Role' + '.' + 'Manage'
SET @MenuName = '��ɫ����'
SET @ActionPath = '/Role/Manage'
SET @Rank = 2
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END


SET @MenuCode = 'Menu' + '.' + 'Manage'
SET @MenuName = '�˵�����'
SET @ActionPath = '/Menu/Manage'
SET @Rank = 3
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END


SET @MenuCode = 'Department' + '.' + 'Manage'
SET @MenuName = '���Ź���'
SET @ActionPath = '/Department/Manage'
SET @Rank = 4
SET @MenuLevel = 1
set @NavigateCode = @MenuCode
IF NOT EXISTS (SELECT * FROM Menu WHERE MenuCode = @MenuCode)
BEGIN
	INSERT INTO Menu ([MenuCode],[MenuName],[MenuLevel],[ParentMenuId],[CreateTime],[Rank],[IsEnabled],[NavigateCode],[ActionPath]) VALUES (@MenuCode,@MenuName,@MenuLevel,@ParentMenuId,GETDATE(),@Rank,1,@NavigateCode,@ActionPath)	
END
