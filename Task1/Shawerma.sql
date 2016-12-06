CREATE TABLE [IngradientCategory] (
	CategoryId integer NOT NULL,
	CategoryName text NOT NULL,
  CONSTRAINT [PK_INGRADIENTCATEGORY] PRIMARY KEY CLUSTERED
  (
  [CategoryId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Ingradient] (
	IngradientId integer NOT NULL,
	IngradientName text NOT NULL,
	TotalWeight integer NOT NULL,
	CategoryId integer NOT NULL,
  CONSTRAINT [PK_INGRADIENT] PRIMARY KEY CLUSTERED
  (
  [IngradientId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [ShawarmaRecipeId] (
	ShawarmaRecieptId integer NOT NULL,
	ShawarmaId integer NOT NULL,
	IngradientId integer NOT NULL,
	Weight integer NOT NULL,
  CONSTRAINT [PK_SHAWARMARECIPEID] PRIMARY KEY CLUSTERED
  (
  [ShawarmaRecieptId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Shawarma] (
	ShawarmaId integer NOT NULL,
	ShawarmaName text NOT NULL,
	CoocingTime text NOT NULL,
  CONSTRAINT [PK_SHAWARMA] PRIMARY KEY CLUSTERED
  (
  [ShawarmaId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [OrderHeader] (
	OrderHeaderId integer NOT NULL,
	SellerId integer NOT NULL,
	OrderDate date NOT NULL,
  CONSTRAINT [PK_ORDERHEADER] PRIMARY KEY CLUSTERED
  (
  [OrderHeaderId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [OrderDetails] (
	OrderHeaderId integer NOT NULL,
	ShawarmaId integer NOT NULL,
	Quantity integer NOT NULL
)
GO
CREATE TABLE [PriceController] (
	PriceControllerId integer NOT NULL,
	ShawarmaId integer NOT NULL,
	Price integer NOT NULL,
	SellingPointId integer NOT NULL,
	Comment text NOT NULL,
  CONSTRAINT [PK_PRICECONTROLLER] PRIMARY KEY CLUSTERED
  (
  [PriceControllerId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [SellingPoint] (
	SellingPointId integer NOT NULL,
	Address text NOT NULL,
	SellingPointCategoryId integer NOT NULL,
	ShawermaTitle text NOT NULL,
  CONSTRAINT [PK_SELLINGPOINT] PRIMARY KEY CLUSTERED
  (
  [SellingPointId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Seller] (
	SellerId integer NOT NULL,
	SellerName text NOT NULL,
	SellingPointId integer NOT NULL,
  CONSTRAINT [PK_SELLER] PRIMARY KEY CLUSTERED
  (
  [SellerId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [SellingPointCategory] (
	SellingPointCategoryId integer NOT NULL,
	SellingPointCategoryName string NOT NULL,
  CONSTRAINT [PK_SELLINGPOINTCATEGORY] PRIMARY KEY CLUSTERED
  (
  [SellingPointCategoryId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [TimeController] (
	TimeControllerId integer NOT NULL,
	SellerId integer NOT NULL,
	WorkStart datetime NOT NULL,
	WorkEnd datetime NOT NULL,
  CONSTRAINT [PK_TIMECONTROLLER] PRIMARY KEY CLUSTERED
  (
  [TimeControllerId] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

ALTER TABLE [Ingradient] WITH CHECK ADD CONSTRAINT [Ingradient_fk0] FOREIGN KEY ([CategoryId]) REFERENCES [IngradientCategory]([CategoryId])
ON UPDATE CASCADE
GO
ALTER TABLE [Ingradient] CHECK CONSTRAINT [Ingradient_fk0]
GO

ALTER TABLE [ShawarmaRecipeId] WITH CHECK ADD CONSTRAINT [ShawarmaRecipeId_fk0] FOREIGN KEY ([ShawarmaId]) REFERENCES [Shawarma]([ShawarmaId])
ON UPDATE CASCADE
GO
ALTER TABLE [ShawarmaRecipeId] CHECK CONSTRAINT [ShawarmaRecipeId_fk0]
GO
ALTER TABLE [ShawarmaRecipeId] WITH CHECK ADD CONSTRAINT [ShawarmaRecipeId_fk1] FOREIGN KEY ([IngradientId]) REFERENCES [Ingradient]([IngradientId])
ON UPDATE CASCADE
GO
ALTER TABLE [ShawarmaRecipeId] CHECK CONSTRAINT [ShawarmaRecipeId_fk1]
GO


ALTER TABLE [OrderHeader] WITH CHECK ADD CONSTRAINT [OrderHeader_fk0] FOREIGN KEY ([SellerId]) REFERENCES [Seller]([SellerId])
ON UPDATE CASCADE
GO
ALTER TABLE [OrderHeader] CHECK CONSTRAINT [OrderHeader_fk0]
GO

ALTER TABLE [OrderDetails] WITH CHECK ADD CONSTRAINT [OrderDetails_fk0] FOREIGN KEY ([OrderHeaderId]) REFERENCES [OrderHeader]([OrderHeaderId])
ON UPDATE CASCADE
GO
ALTER TABLE [OrderDetails] CHECK CONSTRAINT [OrderDetails_fk0]
GO
ALTER TABLE [OrderDetails] WITH CHECK ADD CONSTRAINT [OrderDetails_fk1] FOREIGN KEY ([ShawarmaId]) REFERENCES [Shawarma]([ShawarmaId])
ON UPDATE CASCADE
GO
ALTER TABLE [OrderDetails] CHECK CONSTRAINT [OrderDetails_fk1]
GO

ALTER TABLE [PriceController] WITH CHECK ADD CONSTRAINT [PriceController_fk0] FOREIGN KEY ([ShawarmaId]) REFERENCES [Shawarma]([ShawarmaId])
ON UPDATE CASCADE
GO
ALTER TABLE [PriceController] CHECK CONSTRAINT [PriceController_fk0]
GO
ALTER TABLE [PriceController] WITH CHECK ADD CONSTRAINT [PriceController_fk1] FOREIGN KEY ([SellingPointId]) REFERENCES [SellingPoint]([SellingPointId])
ON UPDATE CASCADE
GO
ALTER TABLE [PriceController] CHECK CONSTRAINT [PriceController_fk1]
GO

ALTER TABLE [SellingPoint] WITH CHECK ADD CONSTRAINT [SellingPoint_fk0] FOREIGN KEY ([SellingPointCategoryId]) REFERENCES [SellingPointCategory]([SellingPointCategoryId])
ON UPDATE CASCADE
GO
ALTER TABLE [SellingPoint] CHECK CONSTRAINT [SellingPoint_fk0]
GO

ALTER TABLE [Seller] WITH CHECK ADD CONSTRAINT [Seller_fk0] FOREIGN KEY ([SellingPointId]) REFERENCES [SellingPoint]([SellingPointId])
ON UPDATE CASCADE
GO
ALTER TABLE [Seller] CHECK CONSTRAINT [Seller_fk0]
GO


ALTER TABLE [TimeController] WITH CHECK ADD CONSTRAINT [TimeController_fk0] FOREIGN KEY ([SellerId]) REFERENCES [Seller]([SellerId])
ON UPDATE CASCADE
GO
ALTER TABLE [TimeController] CHECK CONSTRAINT [TimeController_fk0]
GO

