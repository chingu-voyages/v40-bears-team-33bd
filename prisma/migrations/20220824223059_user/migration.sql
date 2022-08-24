/*
  Warnings:

  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "Post";

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "email" TEXT NOT NULL,
    "username" TEXT,
    "password" TEXT NOT NULL DEFAULT '',
    "wagers_done" INTEGER NOT NULL DEFAULT 0,
    "wagers_won" INTEGER NOT NULL DEFAULT 0,
    "amount_won" INTEGER NOT NULL DEFAULT 0,
    "amount_betted" INTEGER NOT NULL DEFAULT 0,
    "wagers_made" INTEGER NOT NULL DEFAULT 0,
    "api_id" TEXT DEFAULT '',
    "photo" TEXT DEFAULT '',

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");
