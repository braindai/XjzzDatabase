CREATE TABLE [dbo].[Student] (
    [Id]            INT            NOT NULL,
    [LoginUserName] NVARCHAR (256) NULL,
    [StudentId]     NVARCHAR (12)  NOT NULL,
    [Name]          NVARCHAR (30)  NOT NULL,
    [Sex]           NVARCHAR (30)  DEFAULT (N'男') NULL,
    [Tutor]         NVARCHAR (30)  NULL,
    [AsistTutor]    NVARCHAR (30)  NULL,
    [AsistTutorEx]  NVARCHAR (30)  NULL,
    [Major ]        NVARCHAR (30)  NULL,
    [MobilePhone]   NVARCHAR (20)  NULL,
    CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [CK_Student_Sex] CHECK ([Sex]=N'男' OR [Sex]=N'女')
);

