SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[titles] (
		[title_id]      [dbo].[tid] NOT NULL,
		[title]         [varchar](80) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[type]          [char](12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
		[pub_id]        [char](4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[price]         [money] NULL,
		[advance]       [money] NULL,
		[royalty]       [int] NULL,
		[ytd_sales]     [int] NULL,
		[notes]         [varchar](200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
		[pubdate]       [datetime] NOT NULL,
		CONSTRAINT [UPKCL_titleidind]
		PRIMARY KEY
		CLUSTERED
		([title_id])
	ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[titles]
	ADD
	CONSTRAINT [DF__titles__type__07F6335A]
	DEFAULT ('UNDECIDED') FOR [type]
GO
ALTER TABLE [dbo].[titles]
	ADD
	CONSTRAINT [DF__titles__pubdate__09DE7BCC]
	DEFAULT (getdate()) FOR [pubdate]
GO
ALTER TABLE [dbo].[titles]
	WITH CHECK
	ADD CONSTRAINT [FK__titles__pub_id__08EA5793]
	FOREIGN KEY ([pub_id]) REFERENCES [dbo].[publishers] ([pub_id])
ALTER TABLE [dbo].[titles]
	CHECK CONSTRAINT [FK__titles__pub_id__08EA5793]

GO
CREATE NONCLUSTERED INDEX [titleind]
	ON [dbo].[titles] ([title])
	ON [PRIMARY]
GO
ALTER TABLE [dbo].[titles] SET (LOCK_ESCALATION = TABLE)
GO
